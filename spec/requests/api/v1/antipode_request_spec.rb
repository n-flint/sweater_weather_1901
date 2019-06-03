require 'rails_helper'

RSpec.describe 'Antipode for a city', type: :request do
  it 'can get the antipode for a city' do
    get "/api/v1/antipode?loc=hongkong"

    city_data= JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(weather_data).to have_key('data')
    expect(weather_data['data']).to have_key('attributes')
    expect(weather_data['data']['attributes']).to have_key('location_name')
    expect(weather_data['data']['attributes']).to have_key('forecast')
    expect(weather_data['data']).to have_key('search_location')
    require 'pry'; binding.pry
  end
end