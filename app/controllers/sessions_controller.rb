class SessionsController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.find_by(user_params)
        if params[:password].authenticate && @user.save
            session[:user_id] = params[:id]
            redirect '/users/:id'
        else
            redirect '/login'
        end
    end
end