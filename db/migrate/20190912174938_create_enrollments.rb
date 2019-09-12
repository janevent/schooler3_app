class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :course_id
      t.date :start_date
      t.date :end_date
      t.string :progress_report
      t.integer :user_id

      t.timestamps
    end
  end
end
