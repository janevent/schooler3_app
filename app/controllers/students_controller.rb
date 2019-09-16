class StudentsController < ApplicationController
    def new
        @user = User.find_by(id: current_user[:user_id])
        @student = @user.students.build #create
    end

    def create
        @user = User.find_by(id: current_user[:user_id])
        @student = @user.students.build(student_params)
        if current_user && @student.save
            redirect_to user_student_path(@student)
        elsif current_user
            redirect_to user_new_student_path
        else
            redirect_to home_path 
        end

    end

    def show 
        if logged_in?
            @student = Student.find_by(id: params[:student_id])
        else
            redirect_to home_path
        end
    end

    def index
        if logged_in?
            @user = User.find_by(id: current_user[:user_id])
            @students = @user.students
        else
            redirect_to home_path 
        end
    end

    def edit
    end

    def update 
    end
end