class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
        t.string :title
        t.string :content
        t.string :attachment
        t.timestamps
    end
    add_reference :materials, :course, foreign_key: true
  end
end
