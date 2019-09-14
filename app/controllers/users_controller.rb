class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        session[:user_id] = @user.id # params[:id]
    end

    def show 
        @user = User.find_by(id: params[:id])
    end

    def destroy
        session.delete :id
    end

    private 

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
end