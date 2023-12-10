class Order < ApplicationRecord
    has_many :pokemon_orders
    has_many :pokemons, through: :pokemon_orders
end
