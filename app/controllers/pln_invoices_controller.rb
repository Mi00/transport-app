class PlnInvoicesController < ApplicationController
  
  before_action :set_pln_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_sellers, only: [:index, :new, :edit, :create, :update]
  before_action :set_buyers, only: [:index, :new, :edit, :create, :update]

  def index
    @pln_invoices = PlnInvoice.all.order(created_at: :desc)
  end

  def new
  	@pln_invoice = PlnInvoice.new
    @pln_invoice.pln_invoice_items.build(params[:pln_invoice_item])
  end

  def edit

  end

  def show
    respond_to do |format|
      format.html
      format.pdf do 
        render pdf: "faktura_#{@pln_invoice.number}",
                template: "pln_invoices/show.pdf.erb",
                :margin => {:top                => 10,
                           :bottom             => 0,
                           :left               => 0,
                           :right              => 0}
      end
    end
  end

  def create
  	@pln_invoice = PlnInvoice.new(pln_invoice_params)

  	respond_to do |format|
      if @pln_invoice.save
        format.html { redirect_to @pln_invoice, notice: 'pln_invoice was successfully created.' }
        format.json { render :index, status: :created, location: pln_invoices_path }
      else
        format.html { render :new }
        format.json { render json: @pln_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pln_invoices/1
  # PATCH/PUT /pln_invoices/1.json
  def update
    respond_to do |format|
      if @pln_invoice.update(pln_invoice_params)
        format.html { redirect_to @pln_invoice, notice: 'pln_invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @pln_invoice }
      else
        format.html { render :edit }
        format.json { render json: @pln_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pln_invoices/1
  # DELETE /pln_invoices/1.json
  def destroy
    @pln_invoice.destroy
    respond_to do |format|
      format.html { redirect_to pln_invoices_url, notice: 'pln_invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pln_invoice
      @pln_invoice = PlnInvoice.find(params[:id])
      @pln_invoice_items = @pln_invoice.pln_invoice_items
      @prices = @pln_invoice_items.where.not(price_netto: nil).first
    end

    def set_sellers
      @sellers = Seller.all
    end

    def set_buyers
    	@buyers = Buyer.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pln_invoice_params
      params.require(:pln_invoice).permit(:number, :city, :inv_date, :sell_date, :payment_form, :payment_term, :payment_day, :original, :buyer_id, :seller_id, :sum_total, :sum_netto, :sum_vat_value, pln_invoice_items_attributes: PlnInvoiceItem.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
