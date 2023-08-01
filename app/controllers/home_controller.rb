class HomeController < ApplicationController
    #before_action :authenticate_user!  
    layout 'frontend'
 
    def index
        @q = Productdetail.ransack(params[:q])
        @productdetails = @q.result(distinct: true)
        @vendors = Vendor.all
      end
        
    private

    def home_params
      params.require(:q).permit(:product_title_cont)
    end
end
  