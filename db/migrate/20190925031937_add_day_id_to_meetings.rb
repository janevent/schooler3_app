class AddDayIdToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :day_id, :integer
  end
end
