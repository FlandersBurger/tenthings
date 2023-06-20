
module Legacy
  class UsersController < ApplicationController
    def index
      users = Legacy::ConnectionService.new.get("/users/all", {
        limit: 10,
        page: 1
      })
      render(json: {
        data: users,
        size: users.length,
      }, status: 200)
    end
  end
end
