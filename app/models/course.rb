class Course < ActiveRecord::Base
    has_many :attendances
    has_many :users, through: :attendances
    has_many :task_sets, dependent: :destroy
end
