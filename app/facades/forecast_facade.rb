class ForecastFacade
  attr_reader :location, :id

  def initialize(location)
    @id = 1
    @location = location

  end

  def coordinates
    @_service = GeocodeService.new(@location)
  end

end