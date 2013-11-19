Given(/^I am signed in with a premium account$/) do
  @user = User.create!(name: 'casey', password: 'secret123', email: '1@email.me', type: "premium")
  sign_in(@user.name, @user.password)
end

Given(/^I have created a private wiki$/) do
  @title = 'Lorem ipsum'
  @content = 'Lorem ipsum comes from the Latin language...'
  create_private_wiki(@title, @content)
end

Given(/^I try and add a collaborator to my wiki$/) do
  edit_wiki(@title)
  @collaborator = "2@mail.me"
  fill_in("collaborator1", :with => @collaborator)
end

Given(/^I enter an invalid email$/) do
  edit_wiki(@title)
  @collaborator = "elad"
  fill_in("collaborator1", :with => @collaborator)
end