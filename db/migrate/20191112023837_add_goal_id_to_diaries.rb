class AddGoalIdToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :goal_id, :integer
  end
end
