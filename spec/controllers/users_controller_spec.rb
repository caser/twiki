require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = create(:user)
  end

  describe "GET #index" do
    it "populates an array of users" do
      get :index
      assigns(:users).should eq([@user])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: @user.id
      assigns(:user).should eq(@user)
    end
    it "renders the :show template" do
      get :show, id: @user.id
      response.should render_template :show
    end
  end

end    