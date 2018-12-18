class CreatePostages < ActiveRecord::Migration[5.1]
  def change
    create_table :postages do |t|
      t.string     :burden, null: false
      t.timestamps
    end
  end
end
