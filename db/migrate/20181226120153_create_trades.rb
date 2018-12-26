class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.integer  :user_id, null: false, foreign_key: true
      t.integer  :item_id, null: false, foreign_key: true
      t.integer  :transaction_state_id, null: false, foreign_key: true, default: 1
      t.integer  :buyer_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
