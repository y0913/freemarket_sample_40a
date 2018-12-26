class CreateTransactionUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_users do |t|
      t.integer  :user_id, null: false, foreign_key: true
      t.integer  :transaction_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
