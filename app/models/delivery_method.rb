class DeliveryMethod < ApplicationRecord
  has_many :items
  belongs_to :postage
end
