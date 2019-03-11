Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root "static_pages#index"
    resources :categories
    resources :authors
    resources :publishers
    resources :users
  end
end
