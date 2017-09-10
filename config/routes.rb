Rails.application.routes.draw do
  root 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :new, :create]
  resources :leagues, only: [:show]
  get '/start', to: 'start#show'
  resources :weeks, only: [:show]
  resources :contestants, only: [:show]

  namespace :api do
    namespace :v1 do
      namespace :contestants do
        get ':id/weekly_points', to: 'points#show'
      end
    end
  end
end
