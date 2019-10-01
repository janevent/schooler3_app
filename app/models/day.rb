    class Day < ApplicationRecord
        has_many :meetings
    
        

        accepts_nested_attributes_for :meetings

        scope :day_of_week, -> (d){ joins(:meetings).where("name = ?", d) }

        #def self.mondays
            #where(name: 'Monday') 
        #end

        


    end