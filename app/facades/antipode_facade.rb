class AntipodeFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
  end

  def location_name
    coordinates = GeocodeService.new(@location).get_lat_long
    @_location_name = AntipodeService.new(coordinates).get_location
  end

  

end