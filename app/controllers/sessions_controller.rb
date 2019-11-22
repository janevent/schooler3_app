#require 'pry'
class SessionsController < ApplicationController
    def new 
        @user = User.new
    
    end

    def create 
        
        
        #@user = User.find_by(name: params[:user][:name]) #|| User.new
        #binding.pry
        #if !@user 
         #   @user = User.new
        #end 
        
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            #binding.pry
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.new(name: params[:user][:name])
            @user.valid?
            render :new
            #flash[:notice] = "Wrong name or password"
            #redirect_to home_path
        end
    end

    def destroy
        session.delete  :user_id #:id
        #session.clear
        redirect_to home_path
    end

    def omniauth
        
        @user = User.from_omniauth(auth)
        @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
       
      end

      private

      def auth
        request.env['omniauth.auth']
      end

end