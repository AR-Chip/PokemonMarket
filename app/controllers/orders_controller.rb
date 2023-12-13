class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @order = Order.find(params[:id])
    @pokemon_orders = PokemonOrder.where(order: @order)
  end
end
