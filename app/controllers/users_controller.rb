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
            @user = User.find_by(id: params[:id])
            @students = @user.students
        else 
            redirect_to home_path
        end
    end

    def edit 
        if logged_in?
            @user = User.find_by(id: params[:id])
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

    def new_student
        @user = User.find_by(user_id: current_user[:user_id])
        @student = @user.students.build
        #new
        render template: 'students/new'
    end
        
    def create_student
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

    def student 
        if logged_in?
            @student = Student.find_by(id: params[:student_id])
            render template: 'students/show'
        else
            redirect_to home_path
        end
    end

    def student_index
        if logged_in?
            @user = User.find_by(id: current_user[:user_id])
            @students = @user.students
            render template: 'students/index'
        else
            redirect_to home_path 
        end
    end

    def edit_student
        render template: 'students/edit'
    end

    def update_student 
    end



    
    private 

    def user_params
        params.require(:user).permit(:email, :name, :password)
    end
end