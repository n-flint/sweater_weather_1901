class CurrentForecast

  def initialize(weather_data)
    @id = 1
    @summary = weather_data[:summary]
    @temperature = weather_data[:temperature]
  end
end