class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :student_id
      t.integer :tutor_id
      t.float :score
      t.string :comment

      t.timestamps
    end
  end
end
