class HomeController < ApplicationController
    #before_action :authenticate_user!  
 
    def index
        @productdetails = Productdetail.all
    end
end
  