class CoursesController < ApplicationController 

    before_action :check_logged_in

    def new 
        @course = Course.new

        4.times do
            @course.materials.build
        end
        
        3.times do
            @enrollment = @course.enrollments.build
        end 
        # if params[:student_id] don't need to select, build an enrollment with student_id attribute equal to params[:student_id]
        if params[:student_id]
            @student = Student.find_by(id: params[:student_id])
        end
    end

    def create 
        if params[:student_id]
            @student = Student.find_by(id: params[:student_id])
            @course = @student.courses.build(course_params)
            if @course.save!
                redirect_to user_student_course_path(@student, @course)
            else 
                redirect_to new_user_student_course_path(@student)
            end
        else
            @course = Course.new(course_params)
            if @course.save 
                redirect_to course_path(@course) 
            else
                redirect_to new_course_path
            end
        end  
    end 

    def show 
        @course = Course.find_by(id: params[:id])
    end

    def index 
        #@user = User.find_by(id: params[:user_id])
       # @student = Student.find_by(id: params[:student_id])
        #@courses = @student.courses
        #write another index for Course.all? or use conditional?
        #binding.pry
        @courses = Course.all
        
    end 

    
    

    def edit 
        @course = Course.find_by(id: params[:id])
            #update course (using nested form)
            4.times do 
               @course.materials.build 
            end 
            5.times do 
                @course.enrollments.build
            end
            7.times do 
                @course.meetings.build
            end
        
    end

    def update
        @course = Course.find_by(id: params[:id])
        if @course.update(course_params) 
        
            redirect_to course_path(@course)
        else
            redirect_to edit_course_path(@course) 
        end
    end 

    def destroy 
        @course = Course.find_by(id: params[:id])
    end

    private 

    def course_params
        params.require(:course).permit(:title, :description,  materials_attributes: [:id, :item], enrollments_atributes: [:id, :start_date, :end_date, :student_id], meetings_attributes: [:day_id, :start_time, :ebd_time] )
    end

    def check_logged_in
        if !logged_in? || !current_user
            redirect_to home_path
        end
    end
end