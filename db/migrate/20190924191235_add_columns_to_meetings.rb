class AddColumnsToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :start_time_2, :string
    add_column :meetings, :end_time_2, :string
  end
end
