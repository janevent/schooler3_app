class Materialscontroller < ApplicationController
    def create
    end

    def index
        @user = User.find_by(id: current_user[:user_id])
        materials = @user.students.each do |student| 
            student.courses.each do |course|
                course.materials
            end
        end
        @materials = materials
    end
end