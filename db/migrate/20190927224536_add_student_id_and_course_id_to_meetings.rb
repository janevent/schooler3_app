class AddStudentIdAndCourseIdToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :student_id, :integer
    add_column :meetings, :course_id, :integer
  end
end
