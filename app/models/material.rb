class Material < ApplicationRecord
    has_many :course_materials
    has_many :courses, through: :course_materials
    #validates :item, presence: true
   # scope: obtained => {where('obtained = ?', true)}
end
