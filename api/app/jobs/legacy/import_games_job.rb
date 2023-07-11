module Legacy
  class ImportGamesJob < ApplicationJob
    def perform
      games = Legacy::ConnectionService.new.get("/tenthings/games")
      total = games['count']
      i = 1
      games['data'].each do |game|
        pp("#{i}/#{total}")
        game = Legacy::ConnectionService.new.get("/tenthings/game/#{game['chat_id']}")
        params = ActionController::Parameters.new(game).deep_transform_keys(&:underscore)
        params[:legacy_id] = params.delete(:_id)
        params[:platform] = :telegram
        params[:platform_id] = params.delete(:chat_id)
        params[:created_at] = params.delete(:date)
        params[:last_played_at] = params.delete(:last_play_date)
        params[:introduces] = params[:settings][:intro]
        params[:sasses] = params[:settings][:sass]
        params[:snubs] = params[:settings][:snubs]
        params[:updates] = params[:settings][:updates]
        game = Game.find_by_platform_id(params[:platform_id])
        game = Game.create(params.permit(Game.new.permitted_attributes(:create))) if game.nil?
        params[:players].each do |player|
          Legacy::FindPlayerService.new(game, player).perform
        end
        params[:settings][:languages].each do |language|
          game.languages << Language.find_by_code(language) unless language == 'EN'
        end if params[:settings][:languages].present?
        if params[:streak].present?
          streaker = params[:players].find { |player| player[:id] == params[:streak][:player] }
          game.streaker = Legacy::FindPlayerService.new(game, streaker).perform
        end
        i += 1
      end
    end
  end
end
