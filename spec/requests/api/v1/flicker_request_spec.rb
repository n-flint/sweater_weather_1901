require 'rails_helper'

RSpec.describe 'Background image for city', type: :request do
  it 'can get flicker image based on city' do
    get '/api/v1/backgrounds?location=denver,co'

    flicker_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
  end
end