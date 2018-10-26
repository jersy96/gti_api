class CreateSolicitudes < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitudes do |t|
      t.integer :student_id
      t.integer :tutor_id
      t.integer :solicitude_type
      t.integer :payment_method
      t.string :state
      t.timestamp :date
      t.float :hours
      t.string :address
      t.integer :attendants

      t.timestamps
    end
  end
end
