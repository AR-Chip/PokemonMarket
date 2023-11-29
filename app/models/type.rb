class Type < ApplicationRecord
  has_many :pokemon_types
  has_many :pokemons, through: :pokemon_types
end
