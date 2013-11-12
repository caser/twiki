require 'spec_helper'

describe Wiki do

  it "has a valid factory" do
    create(:wiki).should be_valid
  end

  it "is invalid without a title" do
    build(:wiki, title: nil).should_not be_valid
  end

  it "is invalid without an author" do
    build(:wiki, author: nil).should_not be_valid
  end

  context "test the wiki model's relations" do
    before :each do
      @wiki = create(:wiki)
    end

    it "returns the name of the author who created it" do
      @wiki.author.should_not be_nil
    end
  end

  context "test wiki behavior" do
    before :each do
      @wiki = create(:wiki, title: "Sinatra")
      @user = create(:user, name: "Elad", email: "elad@elad.com", password: "watermelon")
    end

    it "should make sure each title is unique" do
      build(:wiki, title: "Sinatra").should_not be_valid
    end

    it "should allow the user to add a collaborator" do
      @wiki.collaborators << @user
      @wiki.viewers.should_not include(@user)
      @wiki.collaborators.should include(@user)
    end

    it "should allow the user to add a viewer" do
      @wiki.viewers << @user
      @wiki.collaborators.should_not include(@user)
      @wiki.viewers.should include(@user)
    end

  end

end