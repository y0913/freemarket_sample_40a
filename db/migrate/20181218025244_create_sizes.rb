class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.integer    :item_id, null: false, foreign_key: true
      t.string     :size, null: false
      t.timestamps
    end
  end
end
