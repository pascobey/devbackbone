Rails.application.routes.draw do
  
  resources :entries
  root to: 'home#index'
  devise_for :users
  resources :profiles, only: [:edit, :update, :show]
  resources :projects, only: [:new, :create, :update, :show]
  
end
