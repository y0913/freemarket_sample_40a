class Brand < ApplicationRecord
  has_many :items
  has_many :categoryies
end
