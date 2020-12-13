class Product < ApplicationRecord
    validates :name, :unidadeMedida, presence: true
end
