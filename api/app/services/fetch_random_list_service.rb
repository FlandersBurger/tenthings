class FetchRandomListService
  def perform
    count = List.count
    random_offset = rand(count)
    List.offset(random_offset).first   
  end
end