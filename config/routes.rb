Rails.application.routes.draw do
  root 'leagues#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :new, :create]
  resources :leagues, only: [:show]
end
