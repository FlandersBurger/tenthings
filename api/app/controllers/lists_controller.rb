class ListsController < ApiController
  before_action :set_resource, only: [:show]
  Serializer = ListBlueprint

  def index
    super(List, Serializer)
  end

  def show(item)
    super(item || @list, Serializer)
  end

  def random
    list = FetchRandomListService.new.perform
    show(list)
  end

  private

  def set_resource
    @list = List.find(params[:id])
  end
end
