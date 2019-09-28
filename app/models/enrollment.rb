class Enrollment < ApplicationRecord
    belongs_to :student
    belongs_to :course
        #validates that start_date and end date are dates
        #has_many archives
    #validates_date :start_date 
    #validates_date :end_date
end
