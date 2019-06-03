class ForecastFacade
  attr_reader :location, :id

  def initialize(location)
    @id = 1
    @location = location
  end

  def coordinates
    @_geocode_service = GeocodeService.new(@location).get_coordinates
  end

  def weather
    @_dark_sky_service = DarkskyService.new(coordinates).get_weather
  end

  def current_forecast
    @_current_forecast = CurrentForecast.new(weather[:currently])
  end

  def daily_forecast
    @_daily_forecast = weather[:daily][:data].map do |day|
      DailyForecast.new(day)
    end
  end

  def hourly_forecast
    @_hourly_forecast = weather[:hourly][:data].map do |hour|
      HourlyForecast.new(hour)
    end
  end

end