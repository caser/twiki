require 'spec_helper'

describe UpgradeController do

  login_user

  before(:each) do
    @billing_info = {"address" => "123 Oak Pl", "city" => "Topeka", "state" => "Kansas", "zip" => "02318",
      "phone" => "12348675309", "ccn" => "0000000000000000", "security_code" => "000"}
    @invalid_billing_info = {}
  end

  describe "GET #show" do
    it "assigns the requested @user to @user" do
      get :show
      assigns(:user).should eq(@user)
    end

    it "renders the #show template" do
      get :show
      response.should render_template :show
    end
  end

  describe "PUT #update" do
    it "works with the @user as @user" do
      put :update, payment: @billing_info
      assigns(:user).should eq(@user)
    end

    it "passes along billing_info as @payment" do
      put :update, payment: @billing_info
      assigns(:payment).should eq (@billing_info)
    end

    context "with valid payment info" do
      it "charges the credit card" do
        # TODO - test credit card processing
      end

      it "changes the account_type of the @user" do
        account_type = @user.account_type
        put :update, payment: @billing_info
        @user.reload
        @user.account_type.should_not eq(account_type)
      end

      it "changes the @user's account_type to 'premium'" do
        account_type = @user.account_type
        put :update, payment: @billing_info
        @user.reload
        @user.account_type.should eq("premium")
      end
    end

    context "with invalid payment info" do
      it "renders the show template" do
        put :update, payment: @invalid_billing_info
        response.should render_template :show
      end
    end
  end
  
end