class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string     :name, null: false
      t.integer    :parent_id
      t.integer    :how_size, null: false
      t.timestamps
    end
  end
end
