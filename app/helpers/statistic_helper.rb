module StatisticHelper
	def sum(car)
		if car != nil
			Car.find(car).rates.sum("value_pln")
		end
	end

  def sum_month(car, date)
    if date != nil
      month = date['month']
      year = date['year']
      rates = Car.find(car).rates.where("cast(strftime('%m', date_column) as int) = ?", month)
    end
  end
end
