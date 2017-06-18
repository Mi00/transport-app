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
		# @rates = Rate.where("created_at >= :start_date AND created_at <= :end_date", {start_date:  params[:start_date], end_date: params[:end_date]})
	end
end
