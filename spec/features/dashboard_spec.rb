require 'rails_helper'

describe "Dashboard" do
	let!(:user) { FactoryGirl.create :user }
	let!(:course1) { FactoryGirl.create :course, name:"Käjä" }
	let!(:taskset) { FactoryGirl.create :task_set }
	let!(:task) { FactoryGirl.create :task}
	

	before :each do
		taskset.tasks << task
		course1.task_sets << taskset
		user.courses << course1
		visit signin_path
		fill_in('username', with:'Pekka')
		fill_in('password', with:'Foobar1')
		click_button('Log in')
	end

  it "can mark task as done" do
		visit dashboard_path
		#check 'taskstate_1'
		find(:css, "#taskstate_1").set(true)
		save_and_open_page
		 expect {
		 	click_button("Submit")
		 }.to change{task.done_by?(user.id)}.from(false).to(true)
	end
end
