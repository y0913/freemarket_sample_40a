class CreateDeliveryMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_methods do |t|
      t.string     :method, null: false
      t.integer    :postage_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
