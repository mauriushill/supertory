Rails.application.routes.draw do
  root "welcome#index"
  # root "items#index"
  
  devise_for :users
  
  resources :comments
  resources :products
  resources :purchases
  resources :facilities
  resources :folders
  resources :items
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
