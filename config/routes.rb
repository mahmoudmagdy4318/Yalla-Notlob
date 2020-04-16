Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :friends
  root to: "home#index"
end
