class MaterialsController < ApplicationController
    

    def index
        @user = User.find_by(id: current_user[:user_id])
        @materials = Material.all #how to access a users materials
        #current_user.students.each do |stu|
        #   stu.courses.each do |co|
        #       co.materials.each do |ma|
        #           ma.item 
                #end
            #end
        #end
        #users-students-enrollments-courses-course_materials -materials
    end
end