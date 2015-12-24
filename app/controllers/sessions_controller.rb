class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      new_token = user.reset_session_token!
      session[:session_token] = new_token
      redirect_to user_url(user)
    else
      redirect_to new_session_url
    end
  end


end
