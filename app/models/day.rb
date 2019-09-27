    class Day < ApplicationRecord
        has_many :meetings
    
        

        accepts_nested_attributes_for :meetings

        #def self.mondays
            #where(name: 'Monday') 
        #end

        


    end