class GeocodeService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    make_call
  end

  private

  def make_call
    response = Faraday.get("http://dev.virtualearth.net/REST/v1/Locations/", query)
    JSON.parse(response.body, symbolize_names: true) [:resourceSets][0][:resources][0][:point][:coordinates]
  end

  def city
    @location.split(", ").first
  end

  def state
    @location.split(", ").second
  end

  def query
    {
      locality: city,
      adminDistrict: state, 
      countryRegion: 'United States',
      key: ENV['BING_KEY']
    }
  end
end