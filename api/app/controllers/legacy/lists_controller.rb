module Legacy
  class ListsController < ApplicationController
    def index
      lists = Legacy::ConnectionService.new.get("/tenthings/lists", {
        limit: 10,
        page: 1
      })
      render(json: {
        data: lists,
        size: lists.length,
      }, status: 200)
    end
  end
end
