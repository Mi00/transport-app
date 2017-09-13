class AddTotalsToPlnInvoiceItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :pln_invoice_items, :total_netto, :decimal
  	add_column :pln_invoice_items, :total_brutto, :decimal
  end
end
