class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string      :title       ,null: false
      t.string      :content     ,null: false
      t.string      :image
      t.integer     :category_id   ,null: false
      t.timestamps
    end
  end
end
