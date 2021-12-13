Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }

  resources :users

  resources :portfolios
  resources :markets

  root to: "home#index"
end
