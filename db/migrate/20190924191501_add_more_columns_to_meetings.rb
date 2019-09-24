class AddMoreColumnsToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :start_time_3, :string
    add_column :meetings, :end_time_3, :string
  end
end
