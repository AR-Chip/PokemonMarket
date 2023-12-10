class SearchController < ApplicationController
  def results
    @query = params[:q]
    if params[:type].present?
      @type = Type.find(params[:type])
      @pokemons = @type.pokemons
    else
      @pokemons = Pokemon.all
    end

    if params[:sale_percentage] == "greater_than_zero"
      @pokemons = @pokemons.where("sale_percentage > ?", 0)
    elsif params[:sale_percentage] == "equal_to_zero"
      @pokemons = @pokemons.where(sale_percentage: 0)
    end

    @pokemons = @pokemons.where("created_at >= ?", 3.days.ago) if params[:created_at] == "yes"

    @pokemons = @pokemons.where("updated_at >= ?", 3.days.ago) if params[:updated_at] == "yes"

    @pokemons = @pokemons.where("name LIKE ?", "%#{@query}%").page(params[:page]).per(20)
  end
end
