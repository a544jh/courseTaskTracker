class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :taskno
      t.string :name
      t.string :description
      t.integer :task_set_id

      t.timestamps null: false
    end
  end
end
