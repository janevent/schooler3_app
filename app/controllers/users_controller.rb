class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id # params[:id]
            redirect_to user_path(@user)
        else
            redirect_to home_path 
        end
    end

    def show 
        if logged_in?
            @user = User.find_by(id: current_user[:user_id])
            @students = @user.students
        else 
            redirect_to home_path
        end
    end

    def edit 
        if logged_in?
            @user = User.find_by(id: current_user[:user_id])
        else 
            redirect_to home_path
        end
    end

    def update 
        if logged_in?
            @user = User.update(user_params)
            redirect_to user_path
        else
            redirect_to home_path
        end
    end

    



    
    private 

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
end