class ChangeExpirationTimeToBeDatetimeInStories < ActiveRecord::Migration[5.1]
  def up
    remove_column :stories, :expiration_time, :time
    add_column :stories, :expiration_time, :datetime
  end

  def down
    remove_column :stories, :expiration_time, :datetime
    add_column :stories, :expiration_time, :time
  end
end
