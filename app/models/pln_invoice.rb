class PlnInvoice < ApplicationRecord
	belongs_to :seller
	belongs_to :buyer
	has_many :pln_invoice_items, inverse_of: :pln_invoice, dependent: :destroy
	accepts_nested_attributes_for :pln_invoice_items, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

	validates :number, presence: true
	validates :city, presence: true
	validates :sell_date, presence: true
	validates :inv_date, presence: true

	before_save :get_payment_date, :update_prices, :get_total_amounts

	def get_payment_date
		if payment_term != nil
			self.payment_day = inv_date + payment_term
		end
	end

	def update_prices
		pln_invoice_items.each(&:get_totalnetto)
	end

	def get_total_amounts
		self.sum_netto = pln_invoice_items.map(&:total_netto).sum(&:to_f)
		self.sum_vat_value = pln_invoice_items.map(&:vat_value).sum(&:to_f)
		self.sum_total = pln_invoice_items.map(&:total).sum(&:to_f)
	end
end
