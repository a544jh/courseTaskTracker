require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new name:"Pekka"

    expect(user.name).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create name:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
end
