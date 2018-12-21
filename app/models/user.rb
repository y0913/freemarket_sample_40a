class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :item_comments
  has_many :sns_credentials, dependent: :destroy
  has_one :address
  has_many :items, dependent: :destroy
  has_many :transaction_users, dependent: :destroy
  # has_many :transactions, through: :transaction_users, dependent: :destroy
  has_many :transaction_comments, dependent: :destroy
  has_many :rates
  has_many :likes
end
