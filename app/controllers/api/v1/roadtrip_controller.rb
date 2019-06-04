class Api::V1::RoadtripController < ApplicationController

  def show
    @start = params['start']
    @end = params['end']
    trip_data = RoadtripFacade.new(@start, @end)

    # require 'pry'; binding.pry
    render json: RoadtripSerializer.new(trip_data)
  end

end