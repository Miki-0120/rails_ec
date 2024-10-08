# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cart_items
  resources :carts
  resources :items
  resources :orders
  resources :order_items
  post 'promotion_codes/discount'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items
  end
  # Defines the root path route ("/")
  # resource :profile,only: %i[show edit new create update destroy]
  root to: 'items#index'
  get 'items/:id' => 'items#show', as: 'show'
end
