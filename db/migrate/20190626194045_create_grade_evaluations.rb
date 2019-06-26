class CreateGradeEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :grade_evaluations do |t|
      t.integer :grade
      t.string  :attachment
      t.timestamps
    end
  end
end
