Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create]

  
  resources :categories, only: [:new, :create]
  
  resources :conditions, only: [:new, :create]
  
  resources :day_to_ships, only: [:new, :create]
  
  resources :delivery_fees, only: [:new, :create]

  resources :prefectures, only: [:new, :create]

end
