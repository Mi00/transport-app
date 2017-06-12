class AddDescriptionToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :description, :string
  end
end
