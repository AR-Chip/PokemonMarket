class SearchController < ApplicationController
  def results
    @query = params[:q]
    # @pokemons = Pokemon.where("name LIKE ?", "%#{@query}%").page(params[:page]).per(20)

    # Filter by category if :category parameter is present
    if params[:type].present?
      @type = Type.find(params[:type])
      @pokemons = @type.pokemons.where("name LIKE ?", "%#{@query}%").page(params[:page]).per(20)
    else
      @pokemons = Pokemon.where("name LIKE ?", "%#{@query}%").page(params[:page]).per(20)
    end
  end
end
