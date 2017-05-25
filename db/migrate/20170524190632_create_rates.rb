class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string :currency
      t.string :table
      t.decimal :value_currency
      t.decimal :value_pln

      t.timestamps
    end
  end
end
