class CreatePlnInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    create_table :pln_invoice_items do |t|
      t.string :name
      t.integer :number
      t.integer :quantity
      t.decimal :price_netto
      t.decimal :price_brutto
      t.integer :vat
      t.decimal :total
      t.references :pln_invoice, foreign_key: true

      t.timestamps
    end
  end
end
