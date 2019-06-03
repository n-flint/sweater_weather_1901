class GeocodeService

  def initialize(location)
    @location = location
    # require 'pry'; binding.pry
  end

  def get_coordinates
    make_call
  end

  def get_lat_long
    response = Faraday.get("http://dev.virtualearth.net/REST/v1/Locations/", rev_query)
    JSON.parse(response.body, symbolize_names: true)[:resourceSets][0][:resources][0][:point][:coordinates]
  end

  def rev_query
    {
      query: @location,
      key: ENV['BING_KEY']
    }
  end

  def query
    {
      locality: city,
      adminDistrict: state, 
      countryRegion: 'United States',
      key: ENV['BING_KEY']
    }
  end


  private

  def make_call
    response = Faraday.get("http://dev.virtualearth.net/REST/v1/Locations/", query)
    # require 'pry'; binding.pry
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