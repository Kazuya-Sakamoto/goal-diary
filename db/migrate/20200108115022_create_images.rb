class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string "image", default: "", null: false
      t.integer "diary_id"
      t.timestamps
    end
  end
end
s