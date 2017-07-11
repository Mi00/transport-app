class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]


	def index
		@buyers = Buyer.all
	end

	def new
		@buyer = Buyer.new
	end

	def show

	end

	def create
		@buyer = Buyer.new(buyer_params)

		respond_to do |format|
			if @buyer.save
				format.html { redirect_to buyers_path, notice: 'buyer was successfully created.' }
				format.json { render :index, status: :created, location: buyers_path }
			else
				format.html { render :new }
				format.json { render json: @buyer.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /buyers/1
  # PATCH/PUT /buyers/1.json
  def update
    respond_to do |format|
      if @buyer.update(buyer_params)
        format.html { redirect_to buyers_path, notice: 'buyer was successfully updated.' }
        format.json { render :show, status: :ok, location: @buyer }
      else
        format.html { render :edit }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1
  # DELETE /buyers/1.json
  def destroy
    @buyer.destroy
    respond_to do |format|
      format.html { redirect_to buyers_url, notice: 'buyer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



	private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
    	@buyer = Buyer.find(params[:id])
    end

    # Never trust parameters from the sbuyery internet, only allow the white list through.
    def buyer_params
    	params.require(:buyer).permit(:name, :address, :city, :postcode, :nip)
    end
end
