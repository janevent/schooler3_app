class Meeting < ApplicationRecord
    belongs_to :student
    belongs_to :course
    belongs_to :user, through: :student
    validates :day, inclusion: { in %w(sunday monday tuesday wednesday thursday friday saturday), message: "%{value} is not a day"}
    #validates start_times and end_times to be a time
    scope: monday => {where(day: monday)}
end
