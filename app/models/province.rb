class Province < ApplicationRecord
    has_many :user
    
    validates :name, :code, :pst, presence: true
    validates :name, :code, uniqueness: true
    validates :pst, numericality: { greater_than_or_equal_to: 0 }
end
