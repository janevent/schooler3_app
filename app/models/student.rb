class Student < ApplicationRecord
    belongs_to :user
    has_many :days
    has_many :meetings, through: :days
    
    has_many :enrollments
    has_many :courses, through: :meetings
    has_many :courses, through: :enrollments
    validates :name, presence: true
end
