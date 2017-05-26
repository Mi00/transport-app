class RatesController < ApplicationController
  
  before_action :set_rate, only: [:show, :edit, :update, :destroy]

  def index
  	@rates = Rate.all
  end

  def new
  	@rate = Rate.new
  end

  def show

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



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:table, :value_currency, :value_pln, :currency, :date, :table_date, :converter)
    end
end
