#require 'pry'
class SessionsController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        #binding.pry
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id #params[:id]
            redirect_to user_path(@user)
        else
            redirect_to home_path
        end
    end

    def destroy
        session.delete  :user_id #:id
        #session.clear
    end

end