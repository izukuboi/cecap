class AddDescriptionToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :description, :string
  end
end
