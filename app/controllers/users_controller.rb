class UsersController < ApplicationController
    
    #signup form
    def new
        logged_in_redirect
    end

    #signup
    def create
        user = User.create(user_params)
        redirect_to user
    end

    def show
        require_login
        @user = User.find_by(id: session[:user_id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
