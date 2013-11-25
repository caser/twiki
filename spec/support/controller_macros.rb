module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = create(:admin)
      sign_in :user, admin
    end
  end

  def login_user(param_user = nil)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create(:user)
      @user.confirm!
      sign_in @user
    end
  end
end
