class Student < ApplicationRecord
    belongs_to :user
    
    
    
    has_many :enrollments
    
    has_many :courses, through: :enrollments
    validates :name, presence: true
end
