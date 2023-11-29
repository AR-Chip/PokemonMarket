class AddImageToPokemon < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :image, :string
  end
end
