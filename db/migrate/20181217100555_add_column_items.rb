class AddColumnItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :condition_id, :integer, null: false, foreign_key: true
    add_column :items, :user_id, :integer, null: false, foreign_key: true
    add_column :items, :postage_id, :integer, null: false, foreign_key: true
    add_column :items, :delivery_method_id, :integer, null: false, foreign_key: true
    add_column :items, :prefecture_id, :integer, null: false, foreign_key: true
    add_column :items, :delivery_day_id, :integer, null: false, foreign_key: true
    add_column :items, :price, :integer, null: false
    add_column :items, :brand_id, :integer, foreign_key: true
    add_column :items, :likes_count, :integer, default: 0
    add_column :items, :category_id, :integer, null: false, foreign_key: true
    add_column :items, :item_state_id, :integer, null: false, foreign_key: true, default: 1
    add_column :items, :size_id, :integer, foreign_key: true,default: 1
  end
end
