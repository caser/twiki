Given(/^the user "(.*?)" has an account$/) do |name|
  @user = User.create!(name: name, password: 'secret123', email: '1@email.me')
end

When(/^he logs in with the correct information$/) do
  sign_in(@user.name, @user.password)
end

When(/^he logs in with the wrong password$/) do
  sign_in(@user.name, 'wrong_password')
end

When(/^he logs in with the wrong username$/) do
  sign_in('LinusT', @user.password)
end

# TODO ? Move to forgot_password.feature
When(/^he tries to retrieve his forgotten password$/) do
  click_link('Forgot password')
  fill_in('Email', :with => @user.email)
  click_button('Reset password')
end
