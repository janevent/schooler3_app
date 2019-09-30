class MeetingsController < ApplicationController

    def new 
        @course = Course.find_by(id: params[:course_id])
        @meeting = @course.meetings.build
    end

    def create 
        #Can I make 7 days in one form? should I have a schedual tables and form?
        @course = Course.find_by(id: params[:course_id])
        #binding.pry
        @meeting = @course.meetings.build(meeting_params)
        if @meeting.save 
            redirect_to course_meeting_path(@course, @meeting)
        else 
            #render :new
            redirect_to new_course_meeting_path(@course)
        end 
    end

    def show 
        @course = Course.find_by(id: params[:course_id])
        @meeting = Meeting.find_by(id: params[:id])
    end

    def index 
        if params[:course_id] && @course = Course.find_by(id: params[:course_id])
            @meetings = @course.meetings
            #binding.pry
            @monday_meetings = Day.day_of_week("Monday")
            #@meetings = @course.meetings
           # @monday_meetings = Meeting.monday_meetings.where(course_id: @course.id)
        else
            @monday_meetings = Day.day_of_week("Monday")
            @meetings = Meeting.all 
        end
        #How to find monday meetings for just this course?
        #@monday_meetings = 
        #@monday_meetings = Meeting.monday_meetings
        
        
        #need scope method to find all mondays( where days name = Monday)
        #@mondays = @days.mondays
        #need scope method to order meetings by time...
    end

    def destroy 
        @meeting = Meeting.find_by(id: params[:id])
        @meeting.destroy
    end

    private 

    def meeting_params 
        params.require(:meeting).permit(:day_id, :start_time, :end_time, :user_id)
    end
end