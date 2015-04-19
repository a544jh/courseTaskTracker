class Task < ActiveRecord::Base
	has_many :task_submissions
	has_many :users, through: :task_submissions
	belongs_to :task_set
	has_one :course, through: :task_set

	def submission_state(user_id)
		sub = self.task_submissions.find_by(user_id:user_id)
		if not sub
			return "undone"
		end
		sub.state
	end

	def done_by?(user_id)
		sub = self.task_submissions.find_by(user_id:user_id)
		if not sub or sub.state == 'undone'
			return false
		else
			return true
		end
	end
end
