require 'rails_helper'

RSpec.describe 'Antipode for a city', type: :request do
  it 'can get the antipode for a city' do
    get "/api/v1/antipode?loc=HongKong,CN"
    

    city_data= JSON.parse(response.body)
    expect(response.code).to eq('200')
    expect(city_data).to have_key('data')
    expect(city_data['data']).to have_key('attributes')
    expect(city_data['data']['attributes']).to have_key('location_name')
    expect(city_data['data']['attributes']).to have_key('forecast')
    expect(city_data['data']['search_location']).to have_key('Hong Kong')
  end
end