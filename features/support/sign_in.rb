module SignInSteps
  def sign_in(username, password)
    visit('/sign_in')
    fill_in('User name', :with => username)
    fill_in('Password', :with => password)
    click_button('Sign in')
  end
end

World(SignInSteps)