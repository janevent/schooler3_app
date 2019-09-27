class Course < ApplicationRecord
    has_many :course_materials
    has_many :materials, through: :course_materials
    has_many :enrollments
    has_many :students, through: :enrollments
    
    has_many :meetings
    
    #has_many :projects
    #has_many :students, through: :projects
    validates :title, presence: true
    accepts_nested_attributes_for :materials
    accepts_nested_attributes_for :days 
    accepts_nested_attributes_for :meetings 
    accepts_nested_attributes_for :enrollments

end
