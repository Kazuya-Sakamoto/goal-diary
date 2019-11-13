class ChangeDataGoalToDiaries < ActiveRecord::Migration[5.2]
  def change
    change_column :diaries, :goal, :datetime 
  end
end
