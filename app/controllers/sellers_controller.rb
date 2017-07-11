class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]


	def index
		@sellers = Seller.all
	end

	def new
		@seller = Seller.new
	end

	def show

	end

	def create
		@seller = Seller.new(seller_params)

		respond_to do |format|
			if @seller.save
				format.html { redirect_to sellers_path, notice: 'seller was successfully created.' }
				format.json { render :index, status: :created, location: sellers_path }
			else
				format.html { render :new }
				format.json { render json: @seller.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to sellers_path, notice: 'seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



	private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
    	@seller = Seller.find(params[:id])
    end

    # Never trust parameters from the ssellery internet, only allow the white list through.
    def seller_params
    	params.require(:seller).permit(:name, :address, :city, :postcode, :nip, :regon, :bank_name, :account_number)
    end
end
