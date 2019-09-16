class StudentsController < ApplicationController
    def new
        @user = User.find_by(id: current_user[:user_id])
        @student = @user.students.new
    end

    def create
    end

    def show 
    end

    def index
    end

    def edit
    end

    def update 
    end
end