class CourseMaterial < ApplicationRecord
    belongs_to :material 
    belongs_to :course

    accepts_nested_attributes_for :material

    def material_attributes=(attributes)
        attributes.values.each do |v|
            self.material = Material.find_or_create_by(v) if !v['item'].empty?
        end
    end
end
