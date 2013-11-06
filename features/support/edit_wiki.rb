module EditWikiSteps
  def edit_wiki(title)
  @wiki = Wiki.where(title: @title)
  visit(wiki_edit_path(@wiki))
  end
end

World(EditWikiSteps)