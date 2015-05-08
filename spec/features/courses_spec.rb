require 'rails_helper'

describe "Course" do
	let!(:user) { FactoryGirl.create :user }
	let!(:course1) { FactoryGirl.create :course, name:"Käjä" }

	before :each do
		visit signin_path
		fill_in('username', with:'Pekka')
		fill_in('password', with:'Foobar1')
		click_button('Log in')
	end

	it "can be created" do
		visit new_course_path
    fill_in('course_name', with:'Ohtu')
    expect {
      click_button("Create Course")
    }.to change{Course.count}.from(1).to(2)
	end

	it "can be destroyed" do
		visit courses_path
		expect {
    	click_link("Destroy")
		}.to change{Course.count}.from(1).to(0)
	end

	it "can be edited" do
		visit courses_path
		click_link "Edit"
		fill_in('course_description', with:'Edited')
		click_button "Update Course"
		expect(Course.first.description).to eq('Edited')
	end

end
