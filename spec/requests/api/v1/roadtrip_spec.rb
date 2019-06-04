require 'rails_helper'

RSpec.describe 'Roadtrip Weather', type: :request do
  it 'can get weather from roadtrip destination' do
    get `/api/v1/road_trip?start=denver,co&end=pueblo,co`

    trip_data = JSON.parse

    expect(response.code).to eq(200)
    expect(user_data['data']['attributes']).to have_key('temperature')
    expect(user_data['data']['attributes']).to have_key('summary')
  end
end

# The object of this assessment is to create an API endpoint to assist in the planning of road trips.

# You will create an endpoint like so:, `/api/v1/road_trip?start=denver,co&end=pueblo,co`

# You will use the Google Directions API:  https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations, and then deliver the weather forecast for the hour
# of arrival.

# For example, Denver to Pueblo would take two hours. You will deliver a forecast two hours in the future that includes the temperature and summary.
# Collapse



