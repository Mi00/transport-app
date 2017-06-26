class FuelsController < ApplicationController
  before_action :set_fuel, only: [:show, :edit, :update, :destroy]
  before_action :set_cars, only: [:index, :new, :edit, :create, :update]


  def index
    @fuels = Fuel.all.order(created_at: :desc)
  end

  def new
    @fuel = Fuel.new
  end

  def show

  end

  def create
    @fuel = Fuel.new(fuel_params)

    respond_to do |format|
      if @fuel.save
        format.html { redirect_to fuels_path, notice: 'fuel was successfully created.' }
        format.json { render :index, status: :created, location: fuels_path }
      else
        format.html { render :new }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuels/1
  # PATCH/PUT /fuels/1.json
  def update
    respond_to do |format|
      if @fuel.update(fuel_params)
        format.html { redirect_to @fuel, notice: 'fuel was successfully updated.' }
        format.json { render :show, status: :ok, location: @fuel }
      else
        format.html { render :edit }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuels/1
  # DELETE /fuels/1.json
  def destroy
    @fuel.destroy
    respond_to do |format|
      format.html { redirect_to fuels_url, notice: 'fuel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel
      @fuel = Fuel.find(params[:id])
    end

    def set_cars
      @cars = Car.all
    end

    # Never trust parameters from the sfuely internet, only allow the white list through.
    def fuel_params
      params.require(:fuel).permit(:liters, :tank_date, :car_id)
    end
end
