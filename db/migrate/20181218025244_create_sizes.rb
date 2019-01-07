class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.string     :size, null: false
      t.integer    :sizing, null: false
      t.timestamps
    end
  end
end
