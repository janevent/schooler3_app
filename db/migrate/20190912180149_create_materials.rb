class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :item
      t.boolean :obtained

      t.timestamps
    end
  end
end
