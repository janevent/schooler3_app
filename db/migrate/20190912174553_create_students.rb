class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :name
      t.string :goal
      t.date :date_goal_updated

      t.timestamps
    end
  end
end
