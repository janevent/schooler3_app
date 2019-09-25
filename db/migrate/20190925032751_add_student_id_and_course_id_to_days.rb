class AddStudentIdAndCourseIdToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :student_id, :integer
    add_column :days, :course_id, :integer
  end
end
