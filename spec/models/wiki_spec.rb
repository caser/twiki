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

  context "test relations" do
    before :each do
      @wiki = create(:wiki)
    end

    it "returns the name of the author who created it" do
      @wiki.author.should_not be_nil
    end
  end

end