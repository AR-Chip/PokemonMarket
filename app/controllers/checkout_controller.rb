class CheckoutController < ApplicationController
    def create
        products = []

        session[:cart].each do |cart_item|
            pokemon = Pokemon.find(cart_item["id"])
            if !pokemon.nil?
                products << { 
                    price_data: {
                        product_data: {
                            name: pokemon.name,
                            description: pokemon.description
                        },
                        unit_amount: (pokemon.price * 100).to_i,
                        currency: 'cad',
                    },
                    quantity: cart_item['qty']
                }
            end
        end

        if products.empty?
            redirect_to root_path
            return
        end
        
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: products,
            mode: 'payment',
            success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: checkout_cancel_url
        )

        respond_to do |format|
            format.js
        end
    end
end
