class RatesController < ApplicationController
  
  before_action :set_rate, only: [:show, :edit, :update, :destroy]

  def index
  	@rates = Rate.all
  end

  def new
  	@rate = Rate.new
    @cars = Car.all
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
    @cars = Car.all

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



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:table, :value_currency, :value_pln, :currency, :date, :table_date, :converter, :car_id, :payment, :printed)
    end
end
