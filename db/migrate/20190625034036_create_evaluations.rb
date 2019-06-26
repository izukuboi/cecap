class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
        t.string :title
        t.string :content
        t.string :attachment
        t.timestamps
    end
  end
end
