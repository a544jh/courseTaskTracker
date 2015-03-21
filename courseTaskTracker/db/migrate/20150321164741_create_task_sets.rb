class CreateTaskSets < ActiveRecord::Migration
  def change
    create_table :task_sets do |t|
      t.integer :course_id
      t.string :name

      t.timestamps null: false
    end
  end
end
