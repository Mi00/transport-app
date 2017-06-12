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
	end
end
