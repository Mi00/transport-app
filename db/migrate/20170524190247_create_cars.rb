class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :car_number

      t.timestamps
    end
  end
end
