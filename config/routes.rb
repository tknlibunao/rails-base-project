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

  namespace :api do
    get '/latest/exchangerate', to: 'exchangerates#index'
 end

  # namespace :api do
  #   get '/ghibli/films', to: 'studio_ghiblis#index'
  # end

  scope module: 'api', path: 'separate_path', as: 'different_prefix'  do
    get '/today/quote', to: 'quotes#index'
  end

  scope module: 'api', path: 'anime', as: 'anime' do
    get '/ghibli/films', to: 'studio_ghiblis#films'
  end
  
  scope module: 'api', path: 'anime', as: 'anime' do
    get '/ghibli/people', to: 'studio_ghiblis#people'
  end
  
  scope module: 'api', path: 'anime', as: 'anime' do
    get '/ghibli/locations', to: 'studio_ghiblis#locations'
  end
end
