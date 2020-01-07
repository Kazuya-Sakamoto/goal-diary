class CreateDiaryCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_categories do |t|
      t.references :category, foreign_key: true
      t.references :diary, foreign_key: true
      t.timestamps
    end
  end
end
