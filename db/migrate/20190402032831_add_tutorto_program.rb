class AddTutortoProgram < ActiveRecord::Migration[5.2]
  def change
    add_reference :programs, :tutor, index: true
  end
end
