Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :lists
  resources :tables
  root to: 'static#index'
end
