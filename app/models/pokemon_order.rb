class PokemonOrder < ApplicationRecord
  belongs_to :pokemon
  belongs_to :order
end
