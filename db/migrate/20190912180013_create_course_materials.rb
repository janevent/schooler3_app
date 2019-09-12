class CreateCourseMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :course_materials do |t|
      t.integer :course_id
      t.integer :material_id

      t.timestamps
    end
  end
end
