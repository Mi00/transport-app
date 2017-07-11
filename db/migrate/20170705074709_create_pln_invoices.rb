class CreatePlnInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :pln_invoices do |t|
    	t.string :number
    	t.string :city
    	t.date :inv_date
    	t.date :sell_date
    	t.string :payment_form
    	t.integer :payment_term
    	t.date :payment_day
    	t.string :route
    	t.date :load_date
    	t.decimal :price_netto
    	t.decimal :total_netto
    	t.decimal :price_brutto
    	t.decimal :total_brutto
    	t.string :car_numbers


      t.timestamps
    end
  end
end
