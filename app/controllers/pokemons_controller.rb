class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order(:name)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
