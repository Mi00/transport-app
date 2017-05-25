class AddDateToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :table_date, :date
    add_column :rates, :date, :date
  end
end
