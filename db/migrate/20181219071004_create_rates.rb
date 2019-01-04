class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer  :rate, null: false
      t.integer  :user_id, null: false, foreign_key: true
      t.text     :comment
      t.integer  :trade_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
