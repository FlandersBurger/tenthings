class ApiController < ActionController::API
  # GET /
  def index(resource, serializer, search_opt: [], permitted_filters: resource.column_names, render_opt: {})
    # filtering
    items = filter(resource, permitted_filters)

    # searching
    items = search(items, search_opt)

    # ordering
    items = order(items)

    # pagination
    items = paginate(items)

    # views
    render_with_view(serializer, items, index_params[:view], {
      **render_opt,
      root: :data,
      meta: {
        count: items.size,
        page: index_params[:page].to_i || 0,
      },
    })
  end
  
  # GET /:id
  def show(item, serializer)
    render_with_view(serializer, item, index_params[:view])
  end

  private

  # parameters
  def index_params
    params.permit(
      :order_by,
      :sort_by,
      :search,
      :page,
      :limit,
      :view,
    )
  end

  # this allows query params of the following format: list?skips=10&skips=20
  def list_params
    deserialized_params = URI.parse(request.url).query
    parsed_params = deserialized_params ? CGI.parse(deserialized_params) : {}

    new_params = {}
    params.each { |k, v| new_params[k] = parsed_params[k].presence || v }

    ActionController::Parameters.new(new_params).permit!
  end

  def filter(resource, permitted_filters = resource.column_names)
    filters(permitted_filters).each do |key, value|
      resource = if value == [nil]
        resource.where({ key => [nil, ''] })
      else
        resource.where({ key => value })
      end
    end
    resource
  end

  def filters(attributes)
    list_params.to_h.slice(*attributes).transform_values do |value|
      if value.respond_to?('map')
        # query params
        value.map do |f|
          if f.include?("..")
            range = f.split("..")
            if range.length == 2 && range[0] == '' # ..b
              ..range[1]
            elsif range.length == 2 # a..b
              range[0]..range[1]
            elsif range.length == 1 # a..
              range[0]..
            end
          elsif f.empty?
            nil
          else
            f
          end
        end
      else
        # path params
        [value]
      end
    end
  end

  def search(resource, search_opt)
    resource = resource.search(index_params[:search], *search_opt) if index_params[:search].present? && !search_opt.empty?
    resource
  end

  def order(resource)
    if index_params[:sort_by].present?
      direction = index_params[:order_by] == 'desc' ? :desc : :asc
      resource = resource.order_nulls_last(index_params[:sort_by], direction:)
    end
    resource.order(:id)
  end

  def paginate(resource)
    resource.paginate(index_params[:page], index_params[:limit] || 10)
  end

  def render_with_view(serializer, resource, view = nil, render_opt = {}, status = :ok)
    if serializer.has_view?(view)
      render_opt[:view] = view
      resource = resource.send(view) if resource.respond_to?(view)
    end
    render(json: serializer.render(resource, **render_opt), status:)
  end
end
