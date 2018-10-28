class AddDescriptionAndTotalDebtToSolicitude < ActiveRecord::Migration[5.1]
  def change
    add_column :solicitudes, :description, :string
    add_column :solicitudes, :total_debt, :float
  end
end
