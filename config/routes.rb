Rails.application.routes.draw do
  
  root to: 'users#index'

  resources :users

  resources :groups

  resources :sessions


end
