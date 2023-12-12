class PokemonsController < ApplicationController

  
  def index
    @pokemons = Pokemon.order(:pokedex_number).page(params[:page]).per(20)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    
    if session[:cart].any? { |p| p["id"] == id }
      session[:cart][session[:cart].index { |p| p["id"] == id }]["qty"] += 1
    else
      session[:cart] << {"id" => id, "qty" => 1} 
    end 

    redirect_to root_path
  end

  def modify_cart_quantity
    id = params[:pokemon_id].to_i
    new_quantity = params[:quantity].to_i
    if new_quantity == 0
      session[:cart].delete_at(session[:cart].index { |p| p["id"] == id })
    else
      session[:cart][session[:cart].index { |p| p["id"] == id }]["qty"] = new_quantity
    end
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete_at(session[:cart].index { |p| p["id"] == id })
    redirect_to root_path
  end
end
