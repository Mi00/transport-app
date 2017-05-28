class AddCarToRates < ActiveRecord::Migration[5.0]
  def change
    add_reference :rates, :car, foreign_key: true
  end
end
