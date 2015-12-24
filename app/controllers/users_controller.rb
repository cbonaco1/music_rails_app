class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      fail
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
