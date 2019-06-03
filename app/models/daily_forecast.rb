class DailyForecast

  def initialize(weather_data)
    @id = 1
    @summary = weather_data[:summary]
    @temperature_high = weather_data[:temperatureHigh]
    @temperature_low = weather_data[:temperatureLow]
    @icon = weather_data[:icon]
  end
end