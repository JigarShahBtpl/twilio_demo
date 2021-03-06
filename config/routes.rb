Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :confirmations, only: [:new, :create]
  get '/logout', to: 'sessions#destroy'

  root 'home#index'
end
