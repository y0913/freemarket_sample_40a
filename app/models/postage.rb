class Postage < ApplicationRecord
  has_many :items
  has_one :delivery_method
end
