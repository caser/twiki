module SignUpSteps
  def sign_up(username, password, email)
    visit('/sign_up')
    fill_in('User name', :with => username)
    fill_in('Password', :with => password)
    fill_in('Email', :with => email)
    click_button('Sign up')
  end
end

World(SignUpSteps)