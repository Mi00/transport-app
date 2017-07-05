module ApplicationHelper
	def find_carname(car_id)
		Car.find(car_id).car_number		
	end

	def humanize_polish_invoice(value)
		cents = number_with_precision(value, precision: 2).last(2)
		if lasttwo == 0
			PolishNumber.translate(value) + " " + "zł" + " " + "00" + " " + "gr"
		else
			PolishNumber.translate(value) + " " + "zł" + " " + "#{cents}" + " " + "gr"
		end
	end
	def humanize_polish_rates(value)
		cents = number_with_precision(value, precision: 2).last(2)
		PolishNumber.translate(value) + " " + "zł" + " " + "#{cents}"+ "/100"
	end
end
