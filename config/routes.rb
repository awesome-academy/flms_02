Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root "static_pages#index"
    resources :categories
    resources :authors
    resources :publishers
    resources :users
    resources :books
    resources :requests
  end

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :books
  resources :requests
  resources :likes
end
