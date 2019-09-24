class RemoveDayFromMeetings < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :day, :string
  end
end
