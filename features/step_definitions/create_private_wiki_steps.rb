Given(/^I create a private wiki$/) do
  @title = 'Lorem ipsum'
  @content = 'Lorem ipsum comes from the Latin language...'
  create_private_wiki(@title, @content)
end

When(/^an un\-authenticated user tries to access the private wiki$/) do
  click_on("Sign out")
  visit_wiki(@title)
end

When(/^a user without proper authorization tries to view a private wiki$/) do
  click_on("Sign out")
  @user = User.create!(name: "elad", email: "2@mail.me", password: "secret", type: "free")
  sign_in(@user.name, @user.password)
  visit_wiki(@title)
end
