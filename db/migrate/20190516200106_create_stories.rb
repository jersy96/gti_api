class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.integer :file_type
      t.string :file
      t.time :expiration_time

      t.timestamps
    end
  end
end
