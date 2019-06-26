class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
        t.string :title
        t.string :content
        t.string :attachment
        t.timestamps
    end
    add_reference :practices, :course, foreign_key: true
  end
end
