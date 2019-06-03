class AntipodeService

  def initialize(coordinates)
    @latitude = coordinates.first
    @longitude = coordinates.second
  end

  def get_antipode_coordinates
    response = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{@latitude}&long=#{@longitude}") do |f|
      f.headers['api_key'] = 'oscar_the_grouch'
    end
    JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
  end

end