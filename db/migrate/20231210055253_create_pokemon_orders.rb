class CreatePokemonOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_orders do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
