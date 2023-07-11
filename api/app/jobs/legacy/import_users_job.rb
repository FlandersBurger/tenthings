module Legacy
  class ImportUsersJob < ApplicationJob
    def perform
      users = Legacy::ConnectionService.new.get("/users/all")
      users.each do |user|
        params = ActionController::Parameters.new(user).deep_transform_keys(&:underscore)
        params[:legacy_id] = params.delete(:_id)
        params[:name] = params.delete(:display_name)
        User.create(params.permit(User.new.permitted_attributes(:create)))
      end
    end
  end
end
