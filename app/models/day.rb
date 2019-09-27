    class Day < ApplicationRecord
        has_many :meetings
        belongs_to :student 
        belongs_to :course

        accepts_nested_attributes_for :meetings

        def self.mondays
            where(name: 'Monday') 
        end

        def self.tuesdays
            where(name: 'Tuesday') 
        end

        def self.wednesdays
            where(name: 'Wednesday') 
        end

        def self.thursdays
            where(name: 'Thursday') 
        end

        def self.fridays
            where(name: 'Friday') 
        end

        def self.saturdays
            where(name: 'Saturday') 
        end

        def self.sundays
            where(name: 'Sunday') 
        end


    end