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

	it "displays error with negative number of tasks" do
		visit course_path(course1)
		click_link('Add task set')
    fill_in('task_set_name', with:'Laskarit')
    fill_in('taskcount', with:'-5')
    click_button('Create Task set')
		expect(page).to have_content('Invalid number of tasks')
		expect(course1.task_sets.count).to eq(0)
	end

	it "can be destroyed" do
		visit course_path(course1)
		click_link('Add task set')
    fill_in('task_set_name', with:'Laskarit')
    fill_in('taskcount', with:'5')
    click_button('Create Task set')

		visit course_path(course1)
		expect {
    	click_link("Destroy")
		}.to change{course1.task_sets.count}.from(1).to(0)
	end

	it "task description can be added" do
		visit course_path(course1)
		click_link('Add task set')
    fill_in('task_set_name', with:'Laskarit')
    fill_in('taskcount', with:'5')
    click_button('Create Task set')
		fill_in('task_set_tasks_attributes_0_description', with:'Tee tämä')
		click_button('Update Task set')
		expect(course1.task_sets.first.tasks.first.description).to eq('Tee tämä')
	end

end
