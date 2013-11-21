class ApplicationController < ActionController::Base
  protect_from_forgery
  # TODO - add authentication / authorization - cancan or here?
  # before_filter :authenticate_user!, :except => [:index]
end
