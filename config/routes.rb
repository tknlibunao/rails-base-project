Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }
  resources :users, :accounts, :wallets, :portfolios, :markets

  root to: "home#index"

  resources :users do
    resources :accounts
  end

  resources :accounts do
    resources :wallets
    resources :portfolios
  end

  # namespace :api do
  #   get '/today/quote', to: 'quotes#index'
  # end

  scope module: 'api', path: 'separate_path', as: 'different_prefix'  do
    get '/today/quote', to: 'quotes#index'
  end
end
