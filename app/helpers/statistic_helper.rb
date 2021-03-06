module StatisticHelper
	def sum(car)
		if car != nil && @rates != nil
      @rates.where(car_id: "#{car}").sum(:value_pln)
		end
	end

	def is_valid?(date)
		if date != nil && date[0].to_date.instance_of?(Date)
			return true
		else
			return false
		end
	end
	def sum_liters(car)
		if !car.nil? && !@fuels.nil?
			@fuels.where(car_id: "#{car}").sum(:liters)
		end
	end
end
