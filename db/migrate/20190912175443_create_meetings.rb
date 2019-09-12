class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :user_id
      t.time :start_time
      t.time :end_time
      t.string :day
      t.string :note

      t.timestamps
    end
  end
end
