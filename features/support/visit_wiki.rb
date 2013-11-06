module VisitWikiSteps
  def visit_wiki(title)
  @wiki = Wiki.where(title: @title)
  visit(wiki_path(@wiki))
  end
end

World(VisitWikiSteps)