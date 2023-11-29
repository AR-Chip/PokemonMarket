Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :pokemons, only: %i[index show]
  get "about", to: "static_pages#about"
  get "contactus", to: "static_pages#contactus"
end
