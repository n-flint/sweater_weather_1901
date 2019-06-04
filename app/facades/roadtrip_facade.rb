class RoadtripFacade
  attr_reader :id

  def initialize(start, finish)
    @id = 1
    @start = start
    @finish = finish
  end

  def travel_time
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@finish}&key=AIzaSyDhDQjEpyB8yVM7XBI-kWwiiDDD1MQv34Y")

    data = JSON.parse(response.body)

    travel_time = data['routes'][0]['legs'][0]['duration']
  end

  def temperature
    response = Faraday.get("https://api.darksky.net/forecast/0eb5005ca21c3ac641d6adb0d54c7995/38.2542024,-104.6087502?exclude=currently,minutely,daily,flags")
    data = JSON.parse(response.body)
    hour = data['hourly']['data'][0]
  end
end