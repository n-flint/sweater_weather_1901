class RoadtripFacade
  attr_reader :id

  def initialize(start, finish)
    @id = 1
    @start = start
    @finish = finish
  end

  def travel_time
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start}&destination=#{@finish}&key=#{ENV['GOOGLE_DIRECTIONS_KEY']}")

    data = JSON.parse(response.body)
    
    travel_time = data['routes'][0]['legs'][0]['duration']['value']
    #takes the travel length then rounds it to the next hour, -1 to search by index value in next call
    hour = (travel_time/3600.00).ceil - 1
    # require 'pry'; binding.pry
  end
  
  def destination_weather
    offset = travel_time
    response = Faraday.get("https://api.darksky.net/forecast/0eb5005ca21c3ac641d6adb0d54c7995/38.2542024,-104.6087502?exclude=currently,minutely,daily,flags")
    
    data = JSON.parse(response.body)
    
    hour_info = data['hourly']['data'][offset]
  end

  def summary
    destination_weather['summary']
  end

  def temperature
    destination_weather['temperature']
  end
end