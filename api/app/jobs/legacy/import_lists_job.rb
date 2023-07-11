module Legacy
  class ImportListsJob < ApplicationJob
    include CategoryHelper
    def perform
      lists = Legacy::ConnectionService.new.get("/tenthings/lists")
      lists.each do |list|
        next unless List.find_by_legacy_id(list['_id']).nil?
        list = Legacy::ConnectionService.new.get("/tenthings/lists/#{list['_id']}")
        params = ActionController::Parameters.new(list).deep_transform_keys(&:underscore)
        params[:legacy_id] = params.delete(:_id)
        created_by = User.find_by_legacy_id(params.delete(:creator)[:_id])
        language = Language.find_by_code(params[:language])
        params[:immutable] = !params.delete(:is_dynamic)
        params[:created_at] = params.delete(:date)
        params[:updated_at] = params.delete(:modify_date)
        categories = params.delete(:categories)
        values = params.delete(:values)
        votes = params.delete(:voters)
        list = List.create(params.permit(List.new.permitted_attributes(:create)).merge(created_by:, language:))
        categories.each do |old_category|
          category = transpose_category(old_category)
          ListCategory.create(list:, category:)
        end
        values.each do |value|
          value[:created_at] = value.delete(:date)
          value_created_by = if value[:creator].present?
            User.find_by_legacy_id(value[:creator][:_id])
          else
            created_by
          end
          if value[:blurb].present?
            value[:blurb_type] = if value[:blurb].starts_with?("https://www.youtube") || value[:blurb].starts_with?("https://youtu.be")
              :youtube
            elsif value[:blurb].starts_with?("https")
              :image
            else
              :text
            end
          end
          ListValue.create(value.permit(
            ListValue.new.permitted_attributes(:create)
          ).merge(list:, created_by: value_created_by))
        end
        votes.each do |vote|
          next unless vote.is_a?(Hash)
          voter = Legacy::FindTelegramUserService.new(vote[:voter].to_f).perform
          Vote.create(list:, voter:, type: vote[:vote])
        end
      end
    end
  end
end
