class CreateFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :fuels do |t|
      t.float :liters
      t.date :tank_date
      t.references :car, foreign_key: true

      t.timestamps
    end
  end
end
