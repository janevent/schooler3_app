class RemoveStudentIdFromMeetings < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :student_id, :integer
  end
end
