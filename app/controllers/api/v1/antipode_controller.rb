class Api::V1::AntipodeController < ApplicationController
  def show
    location = params[:loc]
    antipode = AntipodeFacade.new(location)
  end
end