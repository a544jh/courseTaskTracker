class User < ActiveRecord::Base
	has_secure_password
	validates :name, uniqueness: true, length: { minimum: 3, maximum: 15 }
	has_many :attendances
	has_many :courses, through: :attendances
	has_many :task_sets, through: :courses
	has_many :tasks, through: :task_submissions
end
