class Supermarket < ApplicationRecord
    validates :name, :district, :city, :state, presence: true

    has_many :prices
end
