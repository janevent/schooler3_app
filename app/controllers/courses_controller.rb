class CoursesController < ApplicationController 

    before_action :check_logged_in

    def new 
        @course = Course.new
        @student = Student.find_by(id: params[:student_id] 
    end

    def create 
        @student = Student.find_by(id: params[:student_id])
        @course = @student.courses.build(course_params)
        if @course.save
            redirect_to user_student_course_path(@student, @course)
        else 
            render: '/new'
        end
    end 

    def index 
        @user = User.find_by(id: params[:user_id])
        @student = Student.find_by(id: params[:student_id])
        @courses = @student.courses
    end 

    def edit 
        @course = Course.find_by(id: params[:id])
    end

    def update
        @course = Course.find_by(id: params[:id])
        @course.update(course_params) 
        if @course.valid?
            redirect_to course_path(@course)
        else
            redirect_to home_path 
        end
    end 

    def destroy 
    end

    private 

    def course_params
        params.require(:course).permit(:title, :description )
    end

    def check_logged_in
        if !logged_in? || !current_user
            redirect_to home_path
        end
    end
end