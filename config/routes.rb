Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users

  namespace :admin do
    root "static_pages#index"
    resources :categories, except: :show
    resources :authors, except: :show
    resources :publishers, except: :show
    resources :users, except: :show
    resources :books
    resources :requests, only: %i(index update)
  end


  resources :users, except: %i(index destroy)
  resources :books, only: %i(index show)
  resources :requests, only: :create
  resources :likes, only: %i(create destroy)
  resources :comments, only: %i(create destroy)
  resources :ratings, only: :create
  resources :authors, only: :show
  resources :publishers, only: :show
  resources :categories, only: :show
end
