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
        #Can I make 7 days in one form? should I have a schedual tables and form?
        @course = Course.find_by(id: params[:course_id])
        @day = Day.new(day_params)
        if @day.save 
            redirect_to course_days_path(@course)
        else 
            render :new
        end 
    end

    def index 
        @course = Course.find_by(id: params[:course_id])
        @days = @course.days 
        @monday_meetings = #@days.mondays.each do |mon|
        #                       mon.ordered_meetings
        #                   end 
        #need scope method to find all mondays( where days name = Monday)
        #@mondays = @days.mondays
        #need scope method to order meetings by time...
    end

    private 

    def day_params 
        params.require(:day).permit(:name, meetings_attributes: [:start_time, :end_time])
    end
end