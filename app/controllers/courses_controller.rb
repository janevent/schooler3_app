class CoursesController < ApplicationController 

    before_action :check_logged_in

    def new 
        @course = Course.new
    end

    def create 
        @course = Course.new(course_params)
        redirect_to course_path(@course)
    end 

    def index 
        @courses = Course.all
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