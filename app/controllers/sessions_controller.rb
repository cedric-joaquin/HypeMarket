class SessionsController < ApplicationController
  #login form
  def new
    redirect_to user_path(current_user) if logged_in?
  end

  #login
  def create
    user = User.find_by(username: params[:user][:username])
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  #logout
  def destroy
    session.destroy
    redirect_to '/login'
  end
end
