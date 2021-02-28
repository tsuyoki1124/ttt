Rails.application.routes.draw do
  devise_for :users
  root to: "countries#index"
  resources :users, only: [:edit, :update]
  resources :countries, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create, :destroy, :show, :edit, :update]do
      resources :comments, only: :create
  end
  end
end
