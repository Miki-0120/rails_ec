# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # resource :profile,only: %i[show edit new create update destroy]
  root to: 'items#index'
  get 'items/:id' => 'items#show', as: 'show'
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/new'
    get 'items/create'
    get 'items/update'
    get 'items/destroy'
  resources :items, only: %i[index show edit new create update destroy]
  end
end
