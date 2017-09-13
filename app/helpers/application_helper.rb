module ApplicationHelper
	def find_carname(car_id)
		Car.find(car_id).car_number		
	end

	def humanize_polish_invoice(value)
		cents = number_with_precision(value, precision: 2).last(2)		
		PolishNumber.translate(value) + " " + "zł" + " " + PolishNumber.translate(cents) + " " + "gr"		
	end

	def humanize_polish_rates(value)
		cents = number_with_precision(value, precision: 2).last(2)
		PolishNumber.translate(value) + " " + "zł" + " " + "#{cents}"+ "/100"
	end

	def find_seller(seller_id)
		Seller.find(seller_id)		
	end

	def find_buyer(buyer_id)
		Buyer.find(buyer_id)		
	end
end
