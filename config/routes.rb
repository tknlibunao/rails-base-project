Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }
  resources :users, :admins, :buyers, :wallets, :portfolios, :markets

  root to: "home#index"

  resources :admins do
    resources :buyers
  end

end
