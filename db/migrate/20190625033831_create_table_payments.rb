class CreateTablePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
        t.belongs_to :program, index: true
        t.belongs_to :student, index: true
        t.integer :fee
        t.timestamps
    end
  end
end
