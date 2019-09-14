class UserController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
end