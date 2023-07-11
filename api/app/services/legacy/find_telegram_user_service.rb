module Legacy
  class FindTelegramUserService
    def initialize(telegram_id, params = ActionController::Parameters.new)
      @telegram_id = telegram_id
      @params = params.permit(User.new.permitted_attributes(:create))
    end

    def perform
      user = User.find_by_telegram_id(@telegram_id)
      user = User.create(@params.merge(provider: :telegram, telegram_id: @telegram_id)) if user.nil?
      user
    end
  end
end
