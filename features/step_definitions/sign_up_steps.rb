Given(/^a new user "(.*?)"$/) do |name|
  @user = User.build(name: name, password: "secret", email: "1@mail.me")
end

When(/^he signs up with valid information$/) do
  sign_up(@user.name, @user.password, @user.email)
end

Then(/^he should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^he signs up with a one letter password$/) do
  sign_up(@user.name, "a", @user.email)
end

When(/^he signs up and forgets to put in his email$/) do
  sign_up(@user.name, @user.password, "")
end

When(/^he signs up with a username that already exists$/) do
  User.create!(name: @user.name, password: "secret", email: "2@mail.me")
  sign_up(@user.name, @user.password, @user.email)
end

When(/^he signs up with an email that is already in use$/) do
  User.create!(name: "elad", password: "secret", email: "1@mail.me")
  sign_up(@user.name, @user.password, @user.email)
end