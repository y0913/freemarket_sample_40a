class CreateCategoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :category_items do |t|
      t.integer    :item_id,     null: false, foreign_key: true
      t.integer    :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
