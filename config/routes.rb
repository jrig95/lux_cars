Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  resources :cars do
    resources :rentals, only: [:new, :create]

  end
  put 'update', to: 'pages#update'
  get 'profile', to: 'pages#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
