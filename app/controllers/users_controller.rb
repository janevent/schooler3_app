
#require 'pry'
class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        #binding.pry
        if @user.save
            session[:user_id] =@user.id
            redirect_to user_path(@user)
        else
            render :new
            #redirect_to home_path 
        end
    end

    def show 
        if logged_in?
            #binding.pry
            @user = User.find_by(id: params[:id])
            @students = @user.students
        else 
            redirect_to home_path
        end
    end

    def edit 
        if logged_in?
            @user = User.find_by(id: current_user.id)
        else 
            redirect_to home_path
        end
    end

    def update 
        if logged_in?
            @user = User.find_by(id: current_user.id)
            @user.update(user_params)
            if @user.valid?
                redirect_to user_path
            else 
                render :edit 
            end
        else
            redirect_to home_path
        end
    end

    



    
    private 

    def user_params
        params.require(:user).permit(:email, :email_confirmation, :name, :password)
    end
end