Rails.application.routes.draw do
  get 'home/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :friends
  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
