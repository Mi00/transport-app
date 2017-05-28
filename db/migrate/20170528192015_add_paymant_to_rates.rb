class AddPaymantToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :payment, :boolean
    add_column :rates, :printed, :boolean
  end
end
