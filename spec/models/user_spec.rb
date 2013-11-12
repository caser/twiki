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
    before(:each) do
      @user = create(:user)
      @viewer = create(:user)
      @collaborator = create(:user)
      @wiki1 = create(:wiki, author: @user)
      @wiki2 = create(:wiki, author: @user)
      @section1 = create(:section, author: @user, wiki: @wiki1)
      @section2 = create(:section, author: @user, wiki: @wiki2)
    end

    it "returns a list of wikis the user has authored" do
      @user.wikis.should include(@wiki1, @wiki2)
    end

    it "returns a list of sections the user has authored" do
      @user.sections.should include(@section1, @section2)
    end

    it "returns a list of wikis the user can view" do
      @wiki1.viewers << @viewer
      @viewer.viewable_wikis.should include(@wiki1)
      @viewer.viewable_wikis.should_not include(@wiki2)
    end

    it "returns a list of wikis the user can edit" do
      @wiki1.collaborators << @collaborator
      @collaborator.editable_wikis.should include(@wiki1)
      @collaborator.editable_wikis.should_not include(@wiki2)
    end
  end

end