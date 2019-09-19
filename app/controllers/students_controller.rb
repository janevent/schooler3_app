
#require 'pry'
class StudentsController < ApplicationController
    def new
        #binding.pry
        if logged_in?
            @student = Student.new
            #@student = @user.students.build
        else 
            redirect_to home_path
        end
        
    end
        
    def create
        @student = current_user.students.build(name: params[:user][:student][:name], goal: params[:user][:student][:goal])
        @user = @student.user
       # binding.pry
        #@student.user = User.find_by(id: current_user[:user_id])
        #@user = User.find_by(id: current_user[:user_id])
        #@student = @user.students.build(student_params)
        if current_user && @student.save
            redirect_to user_student_path(@student.user_id, @student)
        elsif current_user
            redirect_to new_user_student_path
        else
            redirect_to home_path 
        end
    end

    def show
        if logged_in?
            @student = Student.find_by(id: params[:id])
            
        else
            redirect_to home_path
        end
    end

    def index
        if logged_in?
            #@user = User.find_by(id: current_user[:user_id])
            @students = Student.all
            
        else
            redirect_to home_path 
        end
    end

    def edit_student
        if current_user
            @user = User.find_by(id: current_user[:user_id])
            @student = Student.find_by(id: params[:student_id])
        else 
            redirect_to home_path 
        end   
    end


    def update_student
        if current_user && @student.update(student_params)
            redirect_to user_student_path(current_user, @student)
        elsif current_user
            render '/edit'
        else 
            redirect_to home_path 
        end 
    end


    private 

    #def student_params 
       # params.require(:student).permit(:name, :goal) if params[:student]
    #end

end