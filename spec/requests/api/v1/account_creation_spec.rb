require 'rails_helper'

RSpec.describe 'Account creation', type: :request do
  it 'can create a user and return an api key' do
    post '/api/v1/users', params: { 'email': 'whatever@example.com', 'password': 'password', 'password_confirmation': 'password'}

    user_data = JSON.parse(response.body)

    expect(response.code).to eq('201')
    expect(user_data['data']).to have_key('attributes')
    expect(user_data['data']['attributes']['api_key'].length).to eq(20)
  end
end