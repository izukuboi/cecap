class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :nombrePrograma
      t.integer :NumModulo
      t.timestamps
    end
  end
end
