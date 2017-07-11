class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :postcode
    	t.string :nip
    	t.string :regon
    	t.string :bank_name
    	t.string :account_number

      t.timestamps
    end
  end
end
