Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'types/index'
  get 'types/show'
  get 'search/results'
  get 'pokemons/index'
  get 'pokemons/show'
  get "search/results"
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

  # Redirect to Root if Page doesn't Exist
  get "*path", to: redirect("/")
end
