class AddActiveToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :active, :boolean
  end
end
