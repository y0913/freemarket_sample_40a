class CreateItemComments < ActiveRecord::Migration[5.1]
  def change
    create_table :item_comments do |t|
      t.text     :comment, null: false
      t.integer  :user_id, null: false, foregin_key: true
      t.integer  :item_id, null: false, foregin_key: true
      t.timestamps
    end
  end
end
