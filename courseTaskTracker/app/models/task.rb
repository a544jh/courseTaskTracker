class Task < ActiveRecord::Base
	has_many :users, through: :task_submissions
end
