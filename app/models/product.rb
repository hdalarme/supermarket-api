class Product < ApplicationRecord
    validates :name, :unidadeMedida, presence: true

    has_many :items
end
