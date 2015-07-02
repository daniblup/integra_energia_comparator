class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery # Same as above
  
  http_basic_authenticate_with name: "integra_energia", password: "password123"
end
