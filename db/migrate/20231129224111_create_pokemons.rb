class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.integer :pokemon_id
      t.string :description
      t.integer :pokedex_number
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
