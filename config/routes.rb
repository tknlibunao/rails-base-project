Rails.application.routes.draw do 
  devise_for :users, controllers: {
    #sessions: 'users/sessions'
    registrations: 'users/registrations'
  }
  resources :users, :buyers, :wallets, :portfolios, :markets
  
  root to: "home#index"
  end

end
