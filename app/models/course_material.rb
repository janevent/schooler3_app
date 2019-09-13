class CourseMaterial < ApplicationRecord
    belongs_to :material 
    belongs_to :course
end
