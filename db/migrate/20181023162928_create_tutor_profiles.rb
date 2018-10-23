class CreateTutorProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :tutor_profiles do |t|
      t.integer :tutor_id
      t.string :description
      t.float :price
      t.float :average

      t.timestamps
    end
  end
end
