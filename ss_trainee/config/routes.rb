# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index', as: 'home'
  get 'about' => 'pages#about', as: 'about'

  resources :posts
end
