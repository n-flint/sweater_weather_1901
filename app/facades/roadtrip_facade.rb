class RoadtripFacade
  attr_reader :id

  def initialize(start, finish)
    @id = 1
    @start = start
    @end = finish
  end

end