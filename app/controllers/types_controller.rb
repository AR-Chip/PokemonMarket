class TypesController < ApplicationController
  def index
    @types = Type.includes(:pokemons).all
  end

  def show
    @type = Type.find(params[:id])
    @pokemons = @type.pokemons
  end
end
