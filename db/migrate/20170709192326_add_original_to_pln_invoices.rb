class AddOriginalToPlnInvoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :pln_invoices, :original, :boolean
  end
end
