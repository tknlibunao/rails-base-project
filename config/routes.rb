Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }

  scope '/admin' do
    resources :users
  end

  resources :users, :accounts, :wallets, :portfolios, :markets, :logs

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
    get '/latest/exchangerate', to: 'exchange_rates#latest'
    get '/historical/exchangerate', to: 'exchange_rates#historical'
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

  resources :markets do
    resources :market_portfolios
    resources :logs
  end

end
