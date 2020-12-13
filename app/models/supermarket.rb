class Supermarket < ApplicationRecord
    validates :name, :district, :city, :state, presence: true
end
