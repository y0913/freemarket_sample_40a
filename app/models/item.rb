class Item < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_one :trade, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :profit, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :brand,optional: true
  belongs_to :postage
  belongs_to :delivery_method
  belongs_to :size, optional: true
  has_many :item_comments, dependent: :destroy
  belongs_to :item_state

  validates :name, presence: true,               length: { maximum: 40 }
  validates :description, presence: true,        length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :delivery_method_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true,              numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
