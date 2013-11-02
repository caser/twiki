Before do
  @address = "123 Pleasant Way"
  @ccn = "0000123400001234"
  @city = "Anytown"
  @state = "Oregon"
  @country = "USA"
  @zip = "19832"
end

Given(/^I am signed in with a free account$/) do
  @user = User.create!(name: 'casey', password: 'secret', email: '1@email.me', type: "free")
  sign_in(@user.name, @user.password)
end

Given(/^I enter in my billing information$/) do
  enter_billing_info(@ccn, @city, @state, @country, @zip)
end

When(/^I try to upgrade my account$/) do
  click_button("Upgrade account")
end

Given(/^I enter in a credit card number that is too short$/) do
  @ccn = "1234"
  enter_billing_info(@address, @ccn, @city, @state, @country, @zip)
end

Given(/^I enter in my information without a zip code$/) do
  @zip = ""
  enter_billing_info(@address, @ccn, @city, @state, @country, @zip)
end

Given(/^I enter in my information without a city$/) do
  @city = ""
  enter_billing_info(@address, @ccn, @city, @state, @country, @zip)
end

Given(/^I enter in my information without a state$/) do
  @state = ""
  enter_billing_info(@address, @ccn, @city, @state, @country, @zip)
end

Given(/^I enter in my information without a country$/) do
  @country = ""
  enter_billing_info(@address, @ccn, @city, @state, @country, @zip)
end

