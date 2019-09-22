class CoursesController < ApplicationController 
    def new 
        @course = Course.new
    end

    def create 
        @course = Course.new(course_params)
        redirect_to course_path(@course)
    end 

    def index 
    end 

    def edit 
    end

    def update 
    end 

    def destroy 
    end

    private 

    def course_params
    
        params.require(:course).permit(:title, :description )
    end
end