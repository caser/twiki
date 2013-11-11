require 'spec_helper'

describe Section do

  it "has a valid factory" do
    create(:section).should be_valid
  end

  it "is invalid without a title" do
    build(:section, title: nil).should_not be_valid
  end

  it "is invalid without a version number" do
    build(:section, version: nil).should_not be_valid
  end

  it "is invalid without an internal_id" do
    build(:section, internal_id: nil).should_not be_valid
  end

  it "is invalid without a related wiki" do
    build(:section, wiki: nil).should_not be_valid
  end

  it "is invalid without an author" do
    build(:section, author: nil).should_not be_valid
  end

  context "test relations" do
    before :each do
      @section = create(:section)
    end

    it "returns the name of the related wiki" do
      @section.wiki.should_not be_nil
    end

    it "returns the name of the author who created it" do
      @section.author.should_not be_nil
    end
  end

end