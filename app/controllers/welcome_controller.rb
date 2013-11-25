class WelcomeController < ApplicationController
  def index
    if current_user
      render wikis_path
    else
      render :layout => "welcome"
    end
  end
end
