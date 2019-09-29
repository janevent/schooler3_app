class Course < ApplicationRecord
    has_many :course_materials
    has_many :materials, through: :course_materials
    has_many :enrollments
    has_many :students, through: :enrollments
    
    has_many :meetings
    
    #has_many :projects
    #has_many :students, through: :projects
    validates :title, presence: true
    accepts_nested_attributes_for :materials,
        :allow_destroy => true,
        :reject_if => all_blank
        

    accepts_nested_attributes_for :meetings
        :reject_if => all_blank 

    accepts_nested_attributes_for :enrollments
        :reject_if => all_blank

    def materials_attributes=(attributes)
        attributes.values.each do |v|
            self.materials << Material.find_or_create_by(v) if !v['item'].empty?
        end
    end

end
