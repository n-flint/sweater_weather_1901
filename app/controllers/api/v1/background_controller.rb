class Api::V1::BackgroundController < ApplicationController

  def show
    location = params[:location]
    background = BackgroundFacade.new(location)
    # require 'pry'; binding.pry
    render json: BackgroundSerializer.new(background)
  end 

end
