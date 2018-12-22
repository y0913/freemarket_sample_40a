class Transaction < ApplicationRecord
  # has_many :transaction_users, dependent: :destroy
  has_many :users, through: :transaction_users, dependent: :destroy
  belongs_to :item
  belongs_to :transaction_state
  belongs_to :buyer, class_name: "User"
end
