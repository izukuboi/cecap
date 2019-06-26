class AddCoursesReftoEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_reference :evaluations, :course, foreign_key: true
  end
end
