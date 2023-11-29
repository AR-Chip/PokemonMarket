Rails.application.routes.draw do
  resources :pokemons, only: %i[index show]
  resources :types, only: %i[index show]

  get "up" => "rails/health#show", as: :rails_health_check
  get "about", to: "static_pages#about"
  get "contactus", to: "static_pages#contactus"

  root to: "pokemons#index"

  # Redirect to Root if Page doesn't Exist
  get "*path", to: redirect("/")
end
