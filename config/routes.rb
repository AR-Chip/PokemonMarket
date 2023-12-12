Rails.application.routes.draw do
  get 'users/show', to: 'users#show', as: "show_user"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end 

  resources :pokemons, only: %i[index show]
  resources :types, only: %i[index show]
  post 'pokemons/add_to_cart/:id', to: 'pokemons#add_to_cart', as: 'add_to_cart'
  delete 'pokemons/remove_from_cart/:id', to: 'pokemons#remove_from_cart', as: 'remove_from_cart'
  post 'pokemons/modify_cart_quantity', to: 'pokemons#modify_cart_quantity', as: 'modify_cart_quantity'

  get "about", to: "static_pages#about"
  get "contactus", to: "static_pages#contactus"

  # Search Results
  # get "search/results"
  get "search_results", to: "search#results"

  # Home Page
  root to: "pokemons#index"
end
