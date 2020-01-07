class RemoveCategoryIdFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :category_id, :integer
  end
end
