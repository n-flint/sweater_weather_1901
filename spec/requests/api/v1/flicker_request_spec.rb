require 'rails_helper'

RSpec.describe 'Background image for city', type: :request do
  it 'can get flicker image based on city' do
    get '/api/v1/backgrounds?location=denver,co'

    flicker_data = JSON.parse(repsone.body)

    expect(respone.code).to eq('200')
  end
end