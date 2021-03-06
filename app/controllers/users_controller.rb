class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.notice = 'Account Created!'
      redirect_to user_path(@user)
    else
      flash.notice = 'Account not created, try again.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # session[:user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
