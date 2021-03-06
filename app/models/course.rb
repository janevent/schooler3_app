class Course < ApplicationRecord
    has_many :course_materials, dependent: :destroy
    has_many :materials, through: :course_materials
    has_many :enrollments, dependent: :destroy
    has_many :students, through: :enrollments
    
    has_many :meetings, dependent: :destroy 
    has_many :days, through: :meetings
    
    #has_many :projects
    #has_many :students, through: :projects
    validates :title, presence: true
    #accepts_nested_attributes_for :materials,
     #   :allow_destroy => true,
      #  :reject_if => all_blank
        

    accepts_nested_attributes_for :meetings,
         :reject_if => :reject_days,
         :reject_if => :reject_start,
         :reject_if => :reject_end

    def reject_days(attributes)
        attributes['day_id'].blank?
    end   
    
    def reject_start(attributes)
        attributes['start_time'].blank?
    end

    def reject_end(attributes)
        attributes['end_time'].blank?
    end
    

    accepts_nested_attributes_for :enrollments,
        :reject_if => :reject_student,
        :reject_if => :reject_e,
        :reject_if => :reject_s

    def reject_student(attributes)
        attributes['student_id'].blank?
    end

    def reject_e(attributes)
        attributes['end_date'].blank?
    end 

    def reject_s(attributes)
        attributes['start_date'].blank?
    end
    

    #def meetings_attributes=(attributes)
      #  attributes.values.each do |v|
           #binding.pry
        #    self.meetings << Meeting.find_or_create_by(v) if !v['day_id'].blank? && !v['start_time'].blank?
       # end
   # end
    accepts_nested_attributes_for :materials, 
        :reject_if => :reject_item 

    def reject_item(attributes)
        attributes['item'].blank?
    end

    #def materials_attributes=(attributes)
     #   attributes.values.each do |v|
     #       self.materials << Material.find_or_create_by(v) if !v['item'].empty?
     #   end
    #end

   # def course_materials_attributes=(attributes)
      #binding.pry  
    #end

end
