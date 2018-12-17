class Category < ApplicationRecord
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items, dependent: :destroy
  belongs_to :size
  belongs_to :parent, class_name: :Category
  has_many :children, class_name: :Category, foreign_key: :parent_id
end
