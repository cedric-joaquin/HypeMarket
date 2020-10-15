class UsersController < ApplicationController
    
    #signup form
    def new
        logged_in_redirect
        @user = User.new
    end

    #signup
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = user.id
            redirect_to user
        else
            render :new
        end
    end

    def show
        require_login
        @user = User.find_by(id: session[:user_id])
    end

    def purchases
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
