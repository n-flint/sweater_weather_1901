class Api::V1::BackgroundController < ApplicationController

  def show
    location = params[:location]
    background = BackgroundFacade.new(location)
    render json: BackgroundSerializer.new(background)
  end 

end
