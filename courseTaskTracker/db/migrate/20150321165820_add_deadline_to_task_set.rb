class AddDeadlineToTaskSet < ActiveRecord::Migration
  def change
    add_column :task_sets, :deadline, :datetime
  end
end
