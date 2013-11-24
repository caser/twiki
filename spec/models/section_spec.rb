require 'spec_helper'

describe Section do

  it "has a valid factory" do
    create(:section).should be_valid
  end

  it "is invalid without a title" do
    build(:section, title: nil).should_not be_valid
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

  context "test the section model's relations" do
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

  context "test versioning" do
    before :each do
      @section = create(:section)
    end

    it "saves a copy of the old version of the section" do
      @section.content = "Super awesome new wiki content."
      @section.save
      @section.diffs.should have(1).item
    end

    it "saves a copy of the old version of the section with correct content" do
      old_content = @section.content
      @section.update_attributes(content: "Super awesome new wiki content.")
      puts "Diffs:"
      puts @section.diffs.inspect
      @section.diffs.last["content"].first.should eq(old_content)
    end

    it "saves copies of multiple previous versions" do
      5.times do |i|
        @section.content = "This is the #{i}th version of the section."
        @section.save
      end
      puts "Diffs:"
      puts @section.diffs.inspect
      @section.diffs.should have(5).items
    end
  end
end