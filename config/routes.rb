Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root "static_pages#index"
    resources :categories
    resources :authors
    resources :publishers
    resources :users
  end

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
end
