class Pokemon < ApplicationRecord
  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :pokemon_orders
  has_many :orders, through: :pokemon_orders

  has_one_attached :pokemon_image
end
