class TransactionState < ApplicationRecord
  has_many :transactions
  has_many :trades
end
