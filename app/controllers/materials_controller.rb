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

    def new 
        @course = Course.find_by(params[:course_id])
        @material = @course.materials.build
    end

    def create 
        @course = Course.find_by(params[:course_id])
        @material = @course.materials.build(material_params)
        if @material.save 
            redirect_to course_path(@course)
        else
            redirect_to new_cours-material_path(@course)
        end
    end

    def show
        @materials = Material.find_by(params[:id])
    end

    def destroy
        @material = Material.find_by(params[:id])
        @material.destroy
        redirect_to materials_path
    end

    private

    def material_params
        params.permit(:material).require(:item)
    end
end