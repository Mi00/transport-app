class AddQuantityToPlnInvoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :pln_invoices, :quantity, :integer
  end
end
