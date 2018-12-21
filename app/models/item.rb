class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :prefecture
  belongs_to :condition
  has_many :category_items, dependent: :destroy
  has_many :categorys, through: :category_items
  belongs_to :delivery_day
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :brand
  belongs_to :postage
  belongs_to :delivery_method
  belongs_to :item_state

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :delivery_method_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
end
