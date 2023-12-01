class AddNameToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :name, :string
  end
end
