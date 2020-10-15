Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :projects, only: [:new, :create, :show]
end
