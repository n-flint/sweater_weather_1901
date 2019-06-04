require 'rails_helper'

RSpec.describe 'Roadtrip Weather', type: :request do
  it 'can get weather from roadtrip destination' do
    get '/api/v1/road_trip?start=denver,co&end=pueblo,co'

    trip_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(trip_data['data']['attributes']['temperature'].class).to eq(Float)
    expect(trip_data['data']['attributes']['summary'].class).to eq(String)
  end
end




