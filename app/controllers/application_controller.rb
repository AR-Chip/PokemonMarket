class ApplicationController < ActionController::Base
    before_action :initialize_session
    before_action :load_cart
    before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def initialize_session
      session[:cart] ||= []
    end
  
    def load_cart
      @cart = []
      @subtotal = 0
      session[:cart].each do |cart_item|  
        pokemon = Pokemon.find(cart_item["id"])
        @subtotal += pokemon.price * cart_item["qty"]
        @cart << {pokemon: pokemon, qty: cart_item["qty"]}
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street_address, :city, :postal_code, :province_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street_address, :city, :postal_code, :province_id])
    end
end
