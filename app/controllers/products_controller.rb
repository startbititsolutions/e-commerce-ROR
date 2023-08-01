class ProductsController < ApplicationController
    layout 'frontend'
    
    
    def index
      @q = Productdetail.ransack(params[:q])
      @vendors = Vendor.all
      
      # @q.sorts = params[:q][:s] if params[:q] && params[:q][:s].present?
      @q.sorts = 'product_title asc' if @q.sorts.empty?

      
      @productdetails = @q.result(distinct: true).includes(:vendor).paginate(page: params[:page], per_page: 10)
    end
    def show
      @vendors = Vendor.all
      @productdetail = Productdetail.find(params[:id])
      @q = Productdetail.ransack(params[:q])
      @productdetails = @q.result(distinct: true)
      @related_products = find_related_products_with_same_vendor(@productdetail)

    end
    def product_vendor
      @vendors = Vendor.all
      @vendor = Vendor.find(params[:vendor_id])
      @q = @vendor.productdetail.ransack(params[:q])
      @products = @q.result(distinct: true)
    end
    def blog

    end
    def contact
      
    end
  
      
    private

    def home_params
      params.require(:q).permit(:product_title_cont, :vendor_id_eq, :s, :price_gteq, :price_lteq)
    end

    def find_related_products_with_same_vendor(productdetail)
      productdetail.vendor.productdetail.where.not(id: productdetail.id).limit(4)
    end
    
end
