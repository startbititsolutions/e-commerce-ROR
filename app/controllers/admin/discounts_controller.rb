module Admin
 class DiscountsController < ApplicationController
  layout 'admin'
 
  before_action  :set_discount, only: %i[ show edit update  destroy]
  before_action :current_cart
  before_action :authenticate_user!  

  
  # GET /discounts or /discounts.json
  def index
    @discounts = Discount.all
   

 
  end

  # GET /discounts/1 or /discounts/1.json
  def show
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
    @discounts = Discount.all
  end
   def get_productdetail_by_vendor
    selected_vendor_ids = params[:vendor_ids]
    products = Productdetail.where(vendor_id: [selected_vendor_ids])

 
    render json: products

   end

  # POST /discounts or /discounts.json
  def create
    @discount = Discount.new(discount_params)
    
    byebug
    respond_to do |format|
      if @discount.save
        format.html { redirect_to  url: admin_discounts_path, notice: "Discount was successfully created." }
        format.json { render :show, status: :created, location: @discount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discounts/1 or /discounts/1.json
  def update    
                              
    respond_to do |format|
      if @discount.update(discount_params)
     
        format.html { redirect_to admin_discount_path, notice: "Discount was successfully updated." }
        format.json { render :show, status: :ok, location: @discount }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discounts/1 or /discounts/1.json
  def destroy
    @discount.delay(run_at: 1.minutes.from_now).schedule_delete
   
    respond_to do |format|
      format.html { redirect_to admin_discounts_path, notice: "Discount will be destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    
    @discount = Discount.find(params[:id])
    @discount.update(status: !@discount.status)
    redirect_back(fallback_location: admin_discounts_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discount_params
      params.require(:discount).permit(:title, :status, :discount_type, :amount_type, :used, :code, :amount, :percentage, :min_purchase_amount, :min_purchase_quantity, :start_date, :end_date, :min_use, :customer_id, :vendor_id, :productdetail_id ,vendors1: [], productdetails1: [])
    end
   
 end
end
