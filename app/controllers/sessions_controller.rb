class SessionsController < ApplicationController
  #login form
  def new
    logged_in_redirect
  end

  #login
  def create
    if params[:user]
      if user = User.find_by(username: params[:user][:username])
        return head(:forbidden) unless user.authenticate(params[:user][:password])
        set_session(user)
      else
        redirect_to '/login'
        return
      end
    else
      user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.username = auth['info']['email']
        u.email = auth['info']['email']
        u.password = auth['uid']
        u.save
      end
    end
    session[:user_id] = user.id
    redirect_to user
  end

  #logout
  def destroy
    session.destroy
    redirect_to '/login'
  end

  private

  #google sign-in
  def auth
    request.env['omniauth.auth']
  end
end

