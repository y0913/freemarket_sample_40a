class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string   :rate, null: false
      t.integer  :user_id, null: false, foreign_key: true
      t.text     :comment
      t.integer  :transaction_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
