class AddReferenceGrades < ActiveRecord::Migration[5.2]
  def change
    add_reference :grade_evaluations, :evaluation, foreign_key: true
    add_reference :grade_evaluations, :student, foreign_key: true
    add_reference :grade_practices, :practice, foreign_key: true
    add_reference :grade_practices, :student, foreign_key: true
  end
end
