module StatisticHelper
	def sum(car)
		if car != nil && @rates != nil
      @rates.where(car_id: "#{car}").sum(:value_pln)
		end
	end
end
