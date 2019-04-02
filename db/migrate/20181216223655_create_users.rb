class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellidop
      t.string :apellidom
      t.string :email
      t.integer :numeroTelf
      t.string :password_digest

      t.timestamps
    end
  end
end
