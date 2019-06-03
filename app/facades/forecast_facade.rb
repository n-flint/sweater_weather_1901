class ForecastFacade
  attr_reader :location, :id

  def initialize(location)
    @id = 1
    @location = location
  end

  def coordinates
    @_geocode_service = GeocodeService.new(@location).get_coordinates
  end

  def weather
    @_dark_sky_service = DarkskyService.new(coordinates)
  end

end