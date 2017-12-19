Rails.application.routes.draw do
  get '/privacy_policy', to: 'privacy_policy#show'
  get '/auth/facebook', as: 'facebook_login'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  root 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :create]
  resources :leagues, only: [:show, :create] do
    resources :teams, only: [:index]
  end
  get '/start', to: 'start#show'
  resources :weeks, only: [:show]
  resources :contestants, only: [:show]
  get '/league_search', to: 'league_search#show'
  resources :team_members, only: [:create]
  resources :teams, only: [:create] do
    resources :draft_picks, only: [:index]
    put '/draft_picks', to: 'draft_picks#update'
  end
  namespace :admin do
    get '/draft', to: 'team_contestants#show'
    resources :team_contestants, only: [:create]
    resources :seasons, only: [:create, :index, :show]
    resources :contestants, only: [:create]
    resources :weeks, only: [:create]
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
