class CarsController < ApplicationController

	def index
		@cars = Car.all
	end

	def new
		@car = Car.new
	end

	def show

	end

	def create
		@car = Car.new(car_params)

		respond_to do |format|
			if @car.save
				format.html { redirect_to cars_path, notice: 'Car was successfully created.' }
				format.json { render :index, status: :created, location: cars_path }
			else
				format.html { render :new }
				format.json { render json: @car.errors, status: :unprocessable_entity }
			end
		end
	end



	private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
    	@car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
    	params.require(:car).permit(:car_number)
    end
end
