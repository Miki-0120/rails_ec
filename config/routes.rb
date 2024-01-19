# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'items#index'
  get 'items/:id' => 'items#show', as: 'show'
end
