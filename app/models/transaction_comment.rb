class TransactionComment < ApplicationRecord
  belongs_to :transactions
  belongs_to :user
end
