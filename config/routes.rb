Rails.application.routes.draw do

  root 'site#index'

  # CJ: don't think you need this one since you have deals resources below :)
  resources :deals
  
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

  # CJ: awesome job with nested resources here!
  resources :businesses do 
    resources :deals
  end

  resources :deals, only: [:index]

  resources :follows, only: [:create]

end