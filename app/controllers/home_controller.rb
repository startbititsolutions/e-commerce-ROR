class HomeController < ApplicationController
    #before_action :authenticate_user!  
    layout 'frontend'
 
    def index
        @productdetails = Productdetail.all
        @vendors = Vendor.all
    end
end
  