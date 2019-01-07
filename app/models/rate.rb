class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :trade

  validates :rate, presence: true
end
