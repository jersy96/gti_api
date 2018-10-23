class CreateStudentProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :student_profiles do |t|
      t.integer :student_id
      t.string :university
      t.string :career

      t.timestamps
    end
  end
end
