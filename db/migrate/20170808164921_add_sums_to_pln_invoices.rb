class AddSumsToPlnInvoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :pln_invoices, :sum_netto, :decimal
  	add_column :pln_invoices, :sum_vat_value, :decimal
  	add_column :pln_invoices, :sum_total, :decimal
  end
end
