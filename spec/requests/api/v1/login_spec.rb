require 'rails_helper'

RSpec.describe 'Login', type: :request do
  it ' can log in' do
    post '/api/v1/sessions', params: { 'email': 'whatever@example.com', 'password': 'password'}

    expect(response.code).to eq('200')
    expect(user_data['data']['attributes']).to have_key('api_key')
  end
end