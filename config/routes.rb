Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/api/v1/forecast', to: 'forcast#show'

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/antipode', to: 'antipode#show'
    end
  end
end
