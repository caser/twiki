When(/^I enter text with Markdown formatting$/) do
  title = "Lorem ipsum"
  content = "# This is a title with __bold__ text and *italic* #"
  enter_wiki_info(title, content)
end

Then(/^I should see the text displayed in proper HTML$/) do
  page.should(have_css('h1 strong.bold')) && page.should(have_css('h2 em.italic'))
end

When(/^I enter text containing a code snippet$/) do
  title = "Lorem ipsum"
  content = "```\nRuby code\n```"
  enter_wiki_info(title, content)
end

Then(/^I should see the code snippet displayed in proper HTML$/) do
  page.should have_css('p code')
end