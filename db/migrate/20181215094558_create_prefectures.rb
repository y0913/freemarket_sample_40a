class CreatePrefectures < ActiveRecord::Migration[5.1]
  def change
    create_table :prefectures do |t|
      t.string     :prefecture
      t.timestamps
    end
  end
end
