module Legacy
  class FindWebsiteUserService
    def initialize(legacy_user_params)
      @legacy_user_params = legacy_user_params
    end

    def perform
      user = User.find_by_legacy_id(@legacy_user_params[:_id]) unless @legacy_user_params[:_id].nil?
      user = User.find_by_legacy_id(@legacy_user_params[:legacy_id]) if user.nil?
      user = User.find_by_username(@legacy_user_params[:username]) if user.nil?
      user = User.find_by_uid(@legacy_user_params[:uid]) if user.nil?
      if user.nil?
        @legacy_user_params[:legacy_id] = @legacy_user_params.delete(:_id)
        @legacy_user_params[:name] = @legacy_user_params.delete(:display_name)
        user = User.create(@legacy_user_params.permit(User.new.permitted_attributes(:create)))
        byebug unless user.errors.empty?
      end
      user
    end
  end
end
