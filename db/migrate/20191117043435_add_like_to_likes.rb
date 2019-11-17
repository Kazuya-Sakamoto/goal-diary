class AddLikeToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :like, :integer
  end
end
