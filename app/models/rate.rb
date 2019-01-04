class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :trade

  validates :rate, presence: true
  validates :agreement, :acceptance => true
end
