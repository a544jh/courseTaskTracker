require 'rails_helper'

describe "Attendance" do
	let!(:user) { FactoryGirl.create :user }
	let!(:course1) { FactoryGirl.create :course, name:"Käjä" }
	
	before :each do
		visit signin_path
		fill_in('username', with:'Pekka')
		fill_in('password', with:'Foobar1')
		click_button('Log in')
	end
	
	it "user can join course" do
		visit course_path(course1)
		expect {
			click_button("Join course")
		}.to change{Attendance.count}.from(0).to(1)
		expect(user.courses.count).to eq(1)
		expect(course1.users.count).to eq(1)
		expect(page).to have_button "Leave course"
	end
end
