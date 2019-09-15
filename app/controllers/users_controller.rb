class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        session[:user_id] = @user.id # params[:id]
    end

    def show 
        if logged_in?
            @user = User.find_by(id: params[:id])
        else 
            redirect_to home_path
        end
    end

    
    private 

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
end