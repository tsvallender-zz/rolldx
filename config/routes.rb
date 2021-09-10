Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :lists
  resources :tables
  resources :list_members, only: [:create]
  resources :follows, only: [:create, :destroy]
  root to: 'static#index'
end
