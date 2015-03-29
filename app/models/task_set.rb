class TaskSet < ActiveRecord::Base
	belongs_to :course
	has_many :tasks
end
