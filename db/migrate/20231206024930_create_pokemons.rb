class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.integer :pokemon_id
      t.text :name
      t.text :description
      t.integer :pokedex_number
      t.float :price
      t.integer :quantity
      t.float :sale_percentage
      t.string :image

      t.timestamps
    end
  end
end
