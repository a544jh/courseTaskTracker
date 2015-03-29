class Task < ActiveRecord::Base
	has_many :users, through: :task_submissions
	belongs_to :task_set
	has_one :course, through: :task_set
end
