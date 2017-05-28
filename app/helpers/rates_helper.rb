module RatesHelper

	def find_carname(car_id)
		Car.find(car_id).car_number
		
	end
end
