class Price < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :supermarket
end
