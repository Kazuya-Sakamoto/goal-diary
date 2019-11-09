class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string      :title       ,null: false
      t.string      :content     ,null: false
      t.string      :image
      t.timestamps

    end
  end
end
