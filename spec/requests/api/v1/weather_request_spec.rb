require 'rails_helper'

RSpec.describe 'Weather For City', type: :request do
  it 'can get weather by city and state' do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to eq(200)
    # require 'pry'; binding.pry
    
  end
end