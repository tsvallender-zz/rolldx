Rails.application.routes.draw do
  get 'list_members/create'
  devise_for :users
  resources :users, only: [:show]
  resources :lists
  resources :tables
  root to: 'static#index'
end
