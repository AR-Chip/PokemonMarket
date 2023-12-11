Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :pokemons, only: %i[index show]
  resources :types, only: %i[index show]
  post 'pokemons/add_to_cart/:id', to: 'pokemons#add_to_cart', as: 'add_to_cart'
  delete 'pokemons/remove_from_cart/:id', to: 'pokemons#remove_from_cart', as: 'remove_from_cart'
  post 'pokemons/modify_cart_quantity', to: 'pokemons#modify_cart_quantity', as: 'modify_cart_quantity'

  get "up" => "rails/health#show", as: :rails_health_check
  get "about", to: "static_pages#about"
  get "contactus", to: "static_pages#contactus"

  # Search Results
  # get "search/results"
  get "search_results", to: "search#results"

  # Home Page
  root to: "pokemons#index"
end
