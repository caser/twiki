module CreatePrivateWikiSteps
  def create_private_wiki(title, content)
    enter_private_wiki_info(title, content)
    click_button('Create wiki')
  end

  def enter_private_wiki_info(title, content)
    visit(wiki_create_path)
    fill_in('Title', :with => title)
    fill_in('Content', :with => content)
    check('Make private')
  end
end

World(CreatePrivateWikiSteps)