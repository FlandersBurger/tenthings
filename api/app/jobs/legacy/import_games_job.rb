module Legacy
  class ImportGamesJob < ApplicationJob
    def perform
      games = Legacy::ConnectionService.new.get("/tenthings/games?limit=5&page=1")
      game = Legacy::ConnectionService.new.get("/tenthings/game/#{games['data'].first['chat_id']}")
      params = ActionController::Parameters.new(game).deep_transform_keys(&:underscore)
      pp(params)
      params[:legacy_id] = params.delete(:_id)
      params[:platform] = :telegram
      params[:platform_id] = params.delete(:chat_id)
      # categories = list[:categories].map do |old_category|
      #   new_category = transpose_category(old_category)
      # end
      # lists.each do |list|
      # params = ActionController::Parameters.new(list)
      #   params[:legacy_id] = user['_id']
      #   User.create(params.permit(User.new.permitted_attributes(:create)))
      # end
    end
  end
end
