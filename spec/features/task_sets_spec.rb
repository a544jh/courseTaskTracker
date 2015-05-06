require 'rails_helper'

describe "TaskSet" do
	let!(:user) { FactoryGirl.create :user }
	let!(:course1) { FactoryGirl.create :course, name:"Käjä" }

	before :each do
		visit signin_path
		fill_in('username', with:'Pekka')
		fill_in('password', with:'Foobar1')
		click_button('Log in')
	end

	it "can add task set with correct number of tasks" do
		visit course_path(course1)
		click_link('Add task set')
    fill_in('task_set_name', with:'Laskarit')
    fill_in('taskcount', with:'5')
    click_button('Create Task set')
    expect(course1.task_sets.first.tasks.count).to eq(5)
	end

end