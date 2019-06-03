class AntipodeFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
  end

  def location_name
    coordinates = GeocodeService.new(@location).get_lat_long
    antipode_coordinates = AntipodeService.new(coordinates).get_antipode_coordinates
    @_location_name = GeocodeService.new(antipode_coordinates).get_name
  end

  

end