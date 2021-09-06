Rails.application.routes.draw do
  get 'static/index'
  devise_for :users
  root to: 'static#index'
end
