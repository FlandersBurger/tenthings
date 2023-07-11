module Legacy
  class FindTelegramUserService
    def initialize(telegram_id, **kwargs)
      @telegram_id = telegram_id
      @kwargs = kwargs
    end

    def perform
      user = User.find_by_telegram_id(@telegram_id)
      user = User.create(provider: :telegram, telegram_id: @telegram_id, **@kwargs) if user.nil?
      user
    end
  end
end
