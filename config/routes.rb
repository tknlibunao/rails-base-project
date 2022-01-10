Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }

  scope '/admin' do
    resources :users
  end

  resources :users, :accounts, :wallets, :portfolios, :markets

  root to: "home#index"

  resources :users do
    resources :accounts
  end

  resources :accounts do
    resources :wallets
    resources :portfolios
  end

end
