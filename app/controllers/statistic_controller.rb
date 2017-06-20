class StatisticController < ApplicationController
	def index
=begin
		@rates = Rate.all
		if params[:search] == nil
			@car = nil
		else
			@car = Car.find(params[:search])
		end
=end
		@cars = Car.all
		if params[:start_date] != nil 
			@rates = Rate.where("date >= :start_date AND date <= :end_date", {start_date:  params[:start_date], end_date: params[:end_date]})
			@sum_rates = @rates.sum(:value_pln)
		else
			@rates = nil
		end
	end
end
