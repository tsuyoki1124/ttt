Rails.application.routes.draw do
  devise_for :users
  root to: "countries#index"
  resources :users, only: [:edit, :update]
  resources :countries, only: [:new, :create]

end
