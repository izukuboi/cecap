class DeleteColumnCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :videolink, :string
  end
end
