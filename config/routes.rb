Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :pokemons, only: %i[index show]
  resources :types, only: %i[index show]

  get "up" => "rails/health#show", as: :rails_health_check
  get "about", to: "static_pages#about"
  get "contactus", to: "static_pages#contactus"

  # Search Results
  # get "search/results"
  get "search_results", to: "search#results"

  # Home Page
  root to: "pokemons#index"
end
