class RemoveGoalIdFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :goal_id, :integer
  end
end
