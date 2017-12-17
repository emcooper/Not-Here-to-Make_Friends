Rails.application.routes.draw do
  root 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :new, :create]
  resources :leagues, only: [:show, :create]
  get '/start', to: 'start#show'
  resources :weeks, only: [:show]
  resources :contestants, only: [:show]
  get '/league_search', to: 'league_search#show'
  resources :teams, only: [] do
    resources :draft_picks, only: [:index]
    put '/draft_picks', to: 'draft_picks#update'
  end
  namespace :admin do
    get '/control_room', to: 'admin#show'
    resources :team_contestants, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      namespace :contestants do
        get ':id/weekly_points', to: 'points#show'
      end
      namespace :leagues do
        get ':id/team_points', to: 'team_points#index'
        get ':id/comments', to: 'comments#index'
        post ':id/comments', to: 'comments#create'
      end
    end
  end
end
