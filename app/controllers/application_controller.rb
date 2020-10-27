class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged_in_redirect, :require_login

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user != nil
    end
    
    def require_login
        redirect_to '/login' if !logged_in?
    end
end
