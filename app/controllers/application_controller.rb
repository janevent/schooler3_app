class ApplicationController < ActionController::Base
    helper_methods :current_user, :logged_in?
    
    def home 
    end

    private

    def current_user 
        @current_user ||= session.find_by(session[:id]) if session[:id]
    end

    def logged_in?
        !!current_user
    end
end
