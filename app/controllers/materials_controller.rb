class Materialscontroller < ApplicationController
    

    def index
        @user = User.find_by(id: current_user[:user_id])
        @materials = Material.all #how to access a users materials
        #users-students-enrollments-courses-course_materials -materials
    end
end