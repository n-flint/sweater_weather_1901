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
    @destination_lat = data['routes'][0]['legs'][0]['end_location']['lat']
    @destination_lng = data['routes'][0]['legs'][0]['end_location']['lng']
    #takes the travel length then rounds it to the next hour, -1 to search by index value in next call
    hour = (travel_time/3600.00).ceil - 1
  end
  
  def destination_weather
    offset = travel_time
    response = DarkskyService.new([@destination_lat, @destination_lng]).get_weather


    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{@destination_lat},#{@destination_lng}?exclude=currently,minutely,daily,flags")
    
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