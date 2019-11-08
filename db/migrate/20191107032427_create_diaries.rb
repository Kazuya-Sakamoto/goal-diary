class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string      :name
      t.string      :title
      t.string      :content
      t.text        :image
      t.timestamps

    end
  end
end
