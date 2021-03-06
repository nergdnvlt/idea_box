class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = 'Successful Login'
      redirect_to user_path(user)
    else
      flash.notice = 'Sorry try again'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
