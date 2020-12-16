class Product < ApplicationRecord
    validates :name, :unidadeMedida, presence: true

    has_many :items
    has_many :prices
end
