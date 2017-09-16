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
  resources :teams, only: [] do
    resources :draft_picks, only: [:index]
    put '/draft_picks', to: 'draft_picks#update'
  end

  namespace :api do
    namespace :v1 do
      namespace :contestants do
        get ':id/weekly_points', to: 'points#show'
      end
    end
  end
end
