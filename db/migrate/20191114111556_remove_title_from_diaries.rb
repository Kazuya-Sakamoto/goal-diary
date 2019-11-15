class RemoveTitleFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :title, :string
  end
end
