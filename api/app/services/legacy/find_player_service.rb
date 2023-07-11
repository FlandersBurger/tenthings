module Legacy
  class FindPlayerService
    def initialize(game, legacy_player_params)
      @game = game
      @legacy_player_params = legacy_player_params
    end

    def perform
      user = Legacy::FindTelegramUserService.new(@legacy_player_params[:id], @legacy_player_params).perform
      player = user.players.find_by_game_id(@game.id)
      player = Player.create(@legacy_player_params.permit(Player.new.permitted_attributes(:create)).merge(game: @game, user:)) if player.nil?
      player
    end
  end
end
