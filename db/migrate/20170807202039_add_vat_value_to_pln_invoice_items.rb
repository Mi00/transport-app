class AddVatValueToPlnInvoiceItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :pln_invoice_items, :vat_value, :decimal
  end
end
