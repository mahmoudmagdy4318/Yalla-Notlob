Rails.application.routes.draw do
  get 'groups/index'
  get 'home/index'

  get 'notification/nots'
  get 'notification/join'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :friends
  root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  resources :orders
  resources :groups
  resources :groups_users
  resources :order_details

  resources :orders_users
  resources :orders do
    post :is_finished, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
