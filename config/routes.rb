Rails.application.routes.draw do

  root 'gossips#index'

  get 'gossips/new', to: 'gossips#new'
  resources :gossips


  end
