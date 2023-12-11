class ApplicationController < ActionController::Base
    before_action :initialize_session
    before_action :load_cart

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
end
