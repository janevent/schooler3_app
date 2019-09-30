class Meeting < ApplicationRecord
    belongs_to :day
    belongs_to :course 
    belongs_to :user
    
    #delegate :user, to: => :student
   # belongs_to :user, through: :student
    #validates :day, inclusion: { in %w(sunday monday tuesday wednesday thursday friday saturday), message: "%{value} is not a day"}
    #validates start_times and end_times to be a time
    
    validates_time :start_time
    validates_time :end_time

    #def self.ordered
       # order("start_time")
    #end
    #scope: ordered -> {order("start_time")}

    #scope :monday_meetings, -> {joins(:day).where(name: "Monday").order#("start_time")}
    
    #scope: monday => {where(day: monday)}
end
