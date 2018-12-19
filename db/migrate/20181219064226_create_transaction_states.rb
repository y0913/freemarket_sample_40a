class CreateTransactionStates < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_states do |t|
      t.string   :state
      t.timestamps
    end
  end
end
