require 'spec_helper'

describe User do

  it "has a valid factory" do
    create(:user).should be_valid
  end

  it "is invalid without a name" do
    build(:user, name: nil).should_not be_valid
  end

  it "is invalid without a password" do
    build(:user, password: nil).should_not be_valid
  end

  it "is invalid without an email" do
    build(:user, email: nil).should_not be_valid
  end

  context "test User relations" do
    # TODO
    it "returns a list of wikis the user has authored"
    it "returns a list of sections the user has authored"
    it "returns a list of wikis the user can view"
    it "returns a list of wikis the user can edit"
  end

end