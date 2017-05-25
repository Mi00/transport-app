class AddConverterToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :converter, :decimal
  end
end
