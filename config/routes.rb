Rails.application.routes.draw do
  devise_for :shippings
  devise_for :orders
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
end