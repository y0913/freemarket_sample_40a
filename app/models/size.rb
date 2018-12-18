class Size < ApplicationRecord
  has_many :items
  has_many :categorys
end
