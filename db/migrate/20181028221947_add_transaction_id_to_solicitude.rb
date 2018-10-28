class AddTransactionIdToSolicitude < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitudes, :transaction_id, :string
  end
end
