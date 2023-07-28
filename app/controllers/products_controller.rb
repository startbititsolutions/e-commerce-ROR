class ProductsController < ApplicationController
    layout 'frontend'
    
       
    def index
        @q = Productdetail.ransack(params[:q])
        @vendors = Vendor.all
            
        if params[:q] && params[:q][:s].present?
          @q.sorts = params[:q][:s]
        else
          @q.sorts = 'created_at desc' # Default sorting if no option selected
        end
            
        @productdetails = @q.result(distinct: true).includes(:vendor).paginate(page: params[:page], per_page: 10)
      end
      
    private

    def home_params
      params.require(:q).permit(:product_title_cont) 
    end
end
