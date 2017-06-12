class RatesController < ApplicationController
  
  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  before_action :set_cars, only: [:index, :new, :edit, :create, :update]

  def index
    @rates = Rate.search(params[:search]).order(created_at: :desc)
  end

  def new
  	@rate = Rate.new
  end

  def edit

  end

  def show
    respond_to do |format|
      format.html
      format.pdf do 
        render pdf: "dowod_wewn_#{@rate.date}",
                template: "rates/show.pdf.erb",
                :margin => {:top                => 0,
                           :bottom             => 0,
                           :left               => 0,
                           :right              => 0}
      end
    end
  end

  def create
  	@rate = Rate.new(rate_params)

  	respond_to do |format|
      if @rate.save
        format.html { redirect_to rates_path, notice: 'Rate was successfully created.' }
        format.json { render :index, status: :created, location: rates_path }
      else
        format.html { render :new }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json
  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to @rate, notice: 'rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @rate }
      else
        format.html { render :edit }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate.destroy
    respond_to do |format|
      format.html { redirect_to rates_url, notice: 'rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    def set_cars
      @cars = Car.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:table, :value_currency, :value_pln, :currency, :date, :table_date, :converter, :car_id, :payment, :printed, :description)
    end
end
