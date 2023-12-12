class CheckoutController < ApplicationController
    before_action :authenticate_user!

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

        tax = session[:taxes]

        if tax["pst"] > 0
            products << { 
                price_data: {
                    product_data: {
                        name: 'PST',
                        description: 'Provincial sales tax'
                    },
                    unit_amount: (tax["pst"] * 100).to_i,
                    currency: 'cad',
                },
                quantity: 1
            }
        end
        
        if tax["gst"] > 0
            products << { 
                price_data: {
                    product_data: {
                        name: 'GST',
                        description: 'General sales tax'
                    },
                    unit_amount: (tax["gst"] * 100).to_i,
                    currency: 'cad',
                },
                quantity: 1
            }
        end

        if tax["hst"] > 0
            products << { 
                price_data: {
                    product_data: {
                        name: 'HST',
                        description: 'Harmonized sales tax'
                    },
                    unit_amount: (tax["hst"] * 100).to_i,
                    currency: 'cad',
                },
                quantity: 1
            }
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

    def review
        @pst = (@subtotal * current_user.province.pst).round(2)
        if current_user.province.hst != 0 || (current_user.province.hst == 0 && current_user.province.pst == 0)
            @gst_rate = 0
            @gst = 0      
        else
            @gst_rate = 0.05
            @gst = (@subtotal * @gst_rate).round(2)
        end
        @hst = (@subtotal * current_user.province.hst).round(2)

        session[:taxes] = {"pst" => @pst, "gst" => @gst, "hst" => @hst}
    end

    def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

        if ((@subtotal + session[:taxes]["pst"] + session[:taxes]["gst"] + session[:taxes]["hst"]) * 100).round(2) == @payment_intent[:amount_received]
            @order = Order.create(
                subtotal: @subtotal,
                tax: (session[:taxes]["pst"] + session[:taxes]["gst"] + session[:taxes]["hst"]).round(2),
                status: "Paid"
            )

            @order.user = current_user
 
            @cart.each do |item|
                PokemonOrder.create(
                    pokemon: item[:pokemon],
                    order: @order,
                    price: item[:pokemon].price,
                    quantity: item[:qty]
                )
            end

            session[:cart] = []
            session[:taxes] = {}
        end
    end
end
