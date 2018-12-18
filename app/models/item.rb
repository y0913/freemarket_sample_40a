class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :prefecture
  belongs_to :condition
  has_many :category_items, dependent: :destroy
  has_many :categorys, through: :category_items
  belongs_to :delivery_day
  has_many :images, dependent: :destroy
  belongs_to :brand
  belongs_to :postage
  belongs_to :delivery_method
  belongs_to :item_state
end
