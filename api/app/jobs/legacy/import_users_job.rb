module Legacy
  class ImportUsersJob < ApplicationJob
    def perform
      users = Legacy::ConnectionService.new.get("/users/all")
      users.each do |user|
        user = ActionController::Parameters.new(user).deep_transform_keys(&:underscore)
        Legacy::FindWebsiteUserService.new(user).perform
      end
    end
  end
end
