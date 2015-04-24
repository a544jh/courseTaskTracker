require 'rails_helper'

RSpec.describe Task, type: :model do

  let!(:user) { FactoryGirl.create :user }
	let!(:course1) { FactoryGirl.create :course, name:"Käjä" }
	let!(:taskset) { FactoryGirl.create :task_set }
	let!(:task) { FactoryGirl.create :task}

  it "returns false for nonexsisting submission" do
    expect(task.done_by?(user)).to be false
  end

  it "returns false for undone submission" do
    TaskSubmission.create(user_id:user.id, task_id:task.id, state:'undone')

    expect(task.done_by?(user)).to be false
  end

  it "returns true for done submission" do
    TaskSubmission.create(user_id:user.id, task_id:task.id, state:'done')

    expect(task.done_by?(user)).to be true
  end

  it "returns correct submission state" do
    TaskSubmission.create(user_id:user.id, task_id:task.id, state:'done')

    expect(task.submission_state(user)).to eq 'done'
  end
end
