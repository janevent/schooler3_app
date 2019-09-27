class RemoveStudentIdAndCourseIdFromDays < ActiveRecord::Migration[5.2]
  def change
    remove_column :days, :student_id, :integer
    remove_column :days, :course_id, :integer
  end
end
