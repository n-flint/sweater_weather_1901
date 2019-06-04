Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/api/v1/forecast', to: 'forcast#show'

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'background#show'
      post '/users', to: 'users#create'
      get '/road_trip', to: 'roadtrip#show'
    end
  end
end
