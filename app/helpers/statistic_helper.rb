module StatisticHelper
	def sum(car)
		if car != nil
			Car.find(car).rates.sum("value_pln")
		end
	end

	def search(search)
  	  	if search != "" && search != nil
  	  		search = search.upcase
  	  		car = Car.find_by_car_number("#{search}")
  	  		where('car_id LIKE ?', "%#{car.id}%")  	  		
  	  	else
  	  		all
  	  	end
  	  end
end
