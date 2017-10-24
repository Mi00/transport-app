class StatisticController < ApplicationController
	def rates
		@cars = Car.all
		if !params[:start_date].nil?
			@rates = Rate.where("date >= :start_date AND date <= :end_date", { start_date: params[:start_date], end_date: params[:end_date]})
			@sum_rates = @rates.sum(:value_pln)
			@chart = @rates.joins(:car).group(:car_number).sum(:value_pln)
		else
			@rates = nil
		end
	end

	def tanks
		@cars = Car.all
		if !params[:start_date].nil?
			@fuels = Fuel.where("tank_date >= :start_date AND tank_date <= :end_date", { start_date: params[:start_date], end_date: params[:end_date]})
			@sum_fuels = @fuels.sum(:liters)
			@chart = @fuels.joins(:car).group(:car_number).sum(:liters)
		else
			@fuels = nil
		end
	end
end
