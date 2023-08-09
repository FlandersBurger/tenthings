module Legacy
  class FindTelegramUserService
    def initialize(telegram_id, params = ActionController::Parameters.new)
      @telegram_id = telegram_id
      @params = params.permit(User.new.permitted_attributes(:create))
      @params.delete(:username) if params.key?(:username) && params[:username].empty?
      @params[:telegram_username] = @params.delete(:username) if params[:username].present?
      @params[:telegram_name] = "#{params[:first_name] || ''} #{params[:last_name] || ''}".strip
    end

    def perform
      user = User.find_by_telegram_id(@telegram_id)
      user = User.find_by(telegram_username: @params[:telegram_username], provider: :telegram) if user.nil?
      if user.nil?
        user = User.create(@params.merge(provider: :telegram, telegram_id: @telegram_id))
      else
        user.update(@params)
      end
      user
    end
  end
end
