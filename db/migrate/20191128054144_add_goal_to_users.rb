class AddGoalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :goal, :text
  end
end
