Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :lists
  resources :tables
  resources :list_members, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  root to: 'static#index'
end
