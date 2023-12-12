class Order < ApplicationRecord
    has_many :pokemon_orders
    has_many :pokemons, through: :pokemon_orders

    belongs_to :user

    validates :tax, :subtotal, :status, presence: true
    validates :tax, :subtotal, numericality: { greater_than_or_equal_to: 0 }
end
