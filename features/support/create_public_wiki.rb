module CreatePublicWikiSteps
  def create_public_wiki(title, content)
    enter_wiki_info(title, content)
    click_button('Create wiki')
  end

  def enter_wiki_info(title, content)
    visit(wiki_create_path)
    fill_in('Title', :with => title)
    fill_in('Content', :with => content)
  end
end

World(CreatePublicWikiSteps)