class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order(:pokedex_number).page(params[:page]).per(20)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
