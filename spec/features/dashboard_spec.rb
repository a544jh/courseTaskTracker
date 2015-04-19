require 'rails_helper'

describe "Dashboard" do
	let!(:user) { FactoryGirl.create :user }
	let!(:course1) { FactoryGirl.create :course, name:"Käjä" }

	before :each do
		visit signin_path
		fill_in('username', with:'Pekka')
		fill_in('password', with:'Foobar1')
		click_button('Log in')
	end

  it "can mark task as done" do
		visit dashboard_path
    save_and_open_page
		# expect {
		# 	click_button("Join course")
		# }.to change{Attendance.count}.from(0).to(1)
		# expect(user.courses.count).to eq(1)
		# expect(course1.users.count).to eq(1)
		# expect(page).to have_button "Leave course"
	end
end
