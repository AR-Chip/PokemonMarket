class PokemonOrder < ApplicationRecord
  belongs_to :pokemon
  belongs_to :order

  validates :quantity, :price, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
