Rails.application.routes.draw do
  root "items#index"
  
  resources :comments
  resources :products
  resources :purchases
  resources :facilities
  resources :folders
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
