class AddReferencesToPlnInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :pln_invoices, :buyer, foreign_key: true
    add_reference :pln_invoices, :seller, foreign_key: true
  end
end
