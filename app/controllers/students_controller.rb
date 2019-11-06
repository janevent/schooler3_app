
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
        
        @student = current_user.students.build(name: params[:student][:name], goal: params[:student][:goal])
        
       # binding.pry
        #@student.user = User.find_by(id: current_user[:user_id])
        #@user = User.find_by(id: current_user[:user_id])
        #@student = @user.students.build(student_params)
        if current_user && @student.save
            redirect_to student_path(@student)
        elsif current_user
            redirect_to new_student_path
        else
            redirect_to home_path 
        end
    end

    def show
        if logged_in? && @student = Student.find_by(id: params[:id]) 
            @student 
        elsif logged_in?
            redirect_to students_path
        else
            redirect_to home_path
        end
    end

    def index
        if logged_in?
            @user = User.find_by(id: current_user.id)
            @students = @user.students
            
        else
            redirect_to home_path 
        end
    end

    def edit
        if current_user
            
            @student = Student.find_by(id: params[:id])
        else 
            redirect_to home_path 
        end   
    end


    def update
        @student = Student.find_by(id: params[:id])
        if current_user && @student.update(student_params)
            redirect_to student_path(@student)
        elsif current_user
            render '/edit'
        else 
            redirect_to home_path 
        end 
    end

    def destroy
        @student = Student.find_by(id: params[:id])
        @student.destroy
        redirect_to students_path
    end

    private 

    def student_params 
        params.require(:student).permit(:name, :goal) if params[:student]
    end

end