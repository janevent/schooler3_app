class ApplicationController < ActionController::Base
    helper_methods :current_user, :logged_in?
    
    def home 
    end

    private

    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
end
