class RemoveItemsNamesFromPlnInvoice < ActiveRecord::Migration[5.0]
  def change
  	remove_column :pln_invoices, :route
  	remove_column :pln_invoices, :load_date
  	remove_column :pln_invoices, :price_netto
  	remove_column :pln_invoices, :total_netto
  	remove_column :pln_invoices, :price_brutto
  	remove_column :pln_invoices, :total_brutto
  	remove_column :pln_invoices, :car_numbers
  	remove_column :pln_invoices, :quantity
  end
end
