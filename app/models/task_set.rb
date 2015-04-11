class TaskSet < ActiveRecord::Base
	belongs_to :course
	has_many :tasks, dependent: :destroy
	has_many :task_submissions, through: :tasks
	accepts_nested_attributes_for :tasks

	def populate_with_empty_tasks(count)
		count = count.to_i
		(1..count).each do |i|
			t = Task.new(taskno:i)
			self.tasks << t
		end
	end
end
