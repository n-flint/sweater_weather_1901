class AntipodeService

  def initialize(location)
    @location = location
  end

  def get_location
    response = Faraday.get()
  end

end