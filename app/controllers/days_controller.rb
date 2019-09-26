class DaysController < ApplicationController

    def new 
        @course = Course.find_by(id: params[:course_id])
        7.times do 
            @day = @course.build.days 
            3.times do 
                @meeting = @day.build.meetings 
            end
        end
    end

    def create 
        @course = Course.find_by(id: params[:course_id])
        @day = Day.new(day_params)
        if @day.save 
            redirect_to course_days_path(@course)
        else 
            render :new
        end 
    end

    def index 
    end
end