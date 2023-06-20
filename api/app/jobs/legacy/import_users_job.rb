module Legacy
  class ImportUsersJob < ApplicationJob
    def perform
      response = Legacy::ConnectionService.new.get("#{BASE_URI}/users/all")
      users = JSON.parse(response.body)
      users.each do |user|
        params = ActionController::Parameters.new(user)
        params[:legacy_id] = user['_id']
        User.create(params.permit(User.new.permitted_attributes(:create)))
      end
    end
  end
end
