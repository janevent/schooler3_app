class CourseMaterial < ApplicationRecord
    belongs_to :material 
    belongs_to :course

    def material_attributes=(attributes)
    end
end
