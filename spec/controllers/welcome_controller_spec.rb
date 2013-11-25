require 'spec_helper'

describe WelcomeController do

  describe "GET #index"
    it "should render the :index view" do
      get :index
      response.should render_template :index
    end
  end
  
end