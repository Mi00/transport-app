class PlnInvoice < ApplicationRecord
	has_one :seller
	has_one :buyer
end
