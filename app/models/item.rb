class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :transactions, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :prefecture
  belongs_to :condition
  has_many :category_items, dependent: :destroy
  has_many :categorys, through: :category_items
  belongs_to :delivery_day
  belongs_to :profit, optional: true
  has_many :images, dependent: :destroy
  belongs_to :brand
  belongs_to :postage
  belongs_to :delivery_method
  belongs_to :size, optional: true
  has_many :item_comments
  belongs_to :item_state
end
