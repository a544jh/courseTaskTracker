class User < ActiveRecord::Base
	has_many :attendances
	has_many :courses, through: :attendances
	has_many :tasks, through: :task_submissions
end
