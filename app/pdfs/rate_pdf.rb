class RatePdf < Prawn::Document
	def initialize(rate)
		super
		@rate = rate
		render "rates/show.html.erb"

	end
end