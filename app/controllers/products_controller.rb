class ProductsController < ApplicationController
    layout 'frontend'
    
       
    def index
      @q = Productdetail.ransack(params[:q])
      @vendors = Vendor.all
      
      @q.sorts = params[:q][:s] if params[:q] && params[:q][:s].present?
      
      @productdetails = @q.result(distinct: true).includes(:vendor).paginate(page: params[:page], per_page: 10)
    end
    def show
      @productdetail = Productdetail.find(params[:id])
    end
  
      
    private

    def home_params
      params.require(:q).permit(:product_title_cont, :vendor_id_eq, :s, :price_gteq, :price_lteq)
    end
    
end
