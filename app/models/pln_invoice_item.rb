class PlnInvoiceItem < ApplicationRecord
  belongs_to :pln_invoice, inverse_of: :pln_invoice_items, optional: true
  validates :name, presence: true

  before_save :get_totalnetto


  def get_totalnetto
  	if (price_netto != nil) && (quantity != nil)
  		self.total_netto = price_netto * quantity
  	else
  		self.total_netto = nil
  	end

  	if vat != nil
  		self.vat_value = total_netto * vat/100
  	else
  		self.vat_value = nil
  	end

  	if total_netto != nil
  		self.total = total_netto + vat_value
  	else
  		self.total = total_netto
  	end
  end
  			
end
