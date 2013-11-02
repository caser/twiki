Given(/^I am signed in$/) do
  @user = User.create!(name: 'casey', password: 'secret', email: '1@email.me')
  sign_in(@user.name, @user.password)
end

When(/^I press "(.*?)"$/) do |clickable_text|
  click_on(clickable_text)
end

Then(/^I should see the sign in page$/) do
  current_path.should == user_sign_in_path
end