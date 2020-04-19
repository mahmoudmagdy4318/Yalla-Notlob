<<<<<<< HEAD
Rails.application.routes.draw do
  get 'home/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :friends
  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
=======
Rails.application.routes.draw do
  get 'home/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :friends
  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
>>>>>>> 8cd25da9a46cee863821ae5f67b6753bf01a29a1
