class Api::V1::ForecastController < ApplicationController

  def show
    location = params[:location]
    # require 'pry'; binding.pry
    # AIzaSyDY0pL5f7D2wq-OUIl8sWcEl10M4RqsbhU
    forecast = ForecastFacade.new(location).weather
    render json: forecast.weather
    require 'pry'; binding.pry
  end


end