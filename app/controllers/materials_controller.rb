class MaterialsController < ApplicationController
    

    def index
        if params[:course_id]
            @course = Course.find_by(params[:course_id])
            @materials = @course.materials 
        else
            @user = User.find_by(id: current_user[:user_id])
            @materials = Material.all
        end #how to access a users materials
        #current_user.students.each do |stu|
        #   stu.courses.each do |co|
        #       co.materials.each do |ma|
        #           ma.item 
                #end
            #end
        #end
        #users-students-enrollments-courses-course_materials -materials
    end

    def destroy
        @material = Material.find_by(params[:id])
        @material.destroy
        redirect_to materials_path
    end
end