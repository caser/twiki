Given(/^I create a public wiki$/) do
  @title = 'Lorem ipsum'
  @content = 'Lorem ipsum comes from the Latin language...'
  create_public_wiki(@title, @content)
end

When(/^I go to that wiki's page$/) do
  visit_wiki(@title)
end

Then(/^I should see the content I created$/) do
  page.should have_content(@content)
end

Given(/^I enter (\d+) characters into a wiki$/) do |number|
  @title = "Lorem ipsum"
  @content = "a" * 10
  enter_wiki_info(@title, @content)
end

When(/^I try to create the wiki$/) do
  click_button("Create wiki")
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Given(/^I try to create a wiki without a title$/) do
  @title = ""
  @content = 'Lorem ipsum comes from the Latin language...'
  enter_wiki_info(@title, @content)
end
