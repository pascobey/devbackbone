Rails.application.routes.draw do
  
  get 'stickies/move'
  resources :entries
  root to: 'home#index'
  devise_for :users
  resources :profiles, only: [:edit, :update, :show]
  resources :projects, only: [:new, :create, :update, :show]
  resources :stickies do
    member do 
      patch :move
    end
  end
end
