class Pokemon < ApplicationRecord
  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :pokemon_orders
  has_many :orders, through: :pokemon_orders

  has_one_attached :pokemon_image

  validates :name, :pokedex_number, :price, :quantity, presence: true
  validates :name, :pokedex_number, uniqueness: true
  validates :pokedex_number, :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, :sale_percentage, numericality: true
end
