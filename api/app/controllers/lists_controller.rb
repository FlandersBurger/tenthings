class ListsController < ApiController
  Serializer = ListBlueprint

  def index
    super(List, Serializer)
  end
end
