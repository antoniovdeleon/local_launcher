Rails.application.routes.draw do

  get 'businesses/index'

  get 'businesses/show'

  get 'businesses/new'

  get 'businesses/edit'

  get 'businesses/destroy'

  root 'site#index'
  # users routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users, only: [:create]

  # sessions routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  # post "/sessions", to: "sessions#create"
  resources :sessions, only: [:create]

end