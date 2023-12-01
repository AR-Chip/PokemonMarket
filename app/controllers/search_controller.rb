class SearchController < ApplicationController
  def results
    @query = params[:q]
    @pokemons = Pokemon.where("name LIKE ?", "%#{@query}%").page(params[:page]).per(20)
  end
end
