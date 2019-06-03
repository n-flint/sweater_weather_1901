class DarkskyService

  def initialize(coordinates)
    @coordinates = coordinates
    @latitude = coordinates.first
    @longitude = coordinates.second
  end

  def get_weather
    make_call
  end

  private

  def make_call
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{@latitude},#{@longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end
end