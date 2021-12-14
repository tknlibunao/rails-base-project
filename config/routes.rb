Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }

  resources :users, :admins, :buyers, :wallets
  root to: "home#index"
end
