    class Day < ApplicationRecord
        has_many :meetings
        belongs_to :student 
        belongs_to :course

        accepts_nested_attributes_for :meetings

        #def self.mondays
            #where(name: 'Monday') 
        #end

        


    end