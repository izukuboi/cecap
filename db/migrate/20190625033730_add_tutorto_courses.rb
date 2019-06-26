class AddTutortoCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :tutor, index: true
  end
end
