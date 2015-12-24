class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_user(user)
    new_token = user.reset_session_token!
    session[:session_token] = new_token
  end
end
