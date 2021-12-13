Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }

  resources :users

  resources :portfolios

  root to: "home#index"
end
