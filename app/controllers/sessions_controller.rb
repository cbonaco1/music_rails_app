class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login_user(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Incorrect Username/Password"]
      # redirect_to new_session_url
      render :new
    end
  end

  def destroy
    current_user.session_token = current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end


end
