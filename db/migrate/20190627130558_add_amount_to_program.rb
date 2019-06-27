class AddAmountToProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :amount, :Float
  end
end
