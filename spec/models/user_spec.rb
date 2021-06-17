require 'rails_helper'

RSpec.describe User, type: :model do
  it "user is valid" do
    @user = User.new(
      name: "Lucas", 
      email: "lucas@lucas.com",
      password: "password", 
      phone: "90909090", 
      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")
    ) 
    expect(@user).to be_valid
  end
  

  it "user is not valid" do
    @user = User.new(
      name: "Lucas", 
      email: "lucas@lucas.com",
      password: "password", 
      phone: "90909090", 
    ) 
    expect(@user).to_not be_valid
  end
end
