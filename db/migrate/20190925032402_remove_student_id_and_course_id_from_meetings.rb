class RemoveStudentIdAndCourseIdFromMeetings < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :student_id, :integer
    remove_column :meetings, :course_id, :integer
  end
end
