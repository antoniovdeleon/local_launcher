Rails.application.routes.draw do

  root 'site#index'
  # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  get "/edit_profile", to: "users#edit"
  resources :users, only: [:create, :update]

  # sessions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  # post "/sessions", to: "sessions#create"
  resources :sessions, only: [:create]

  resources :businesses

end