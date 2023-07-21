class VendorsController < ApplicationController
    def index
        @vendors = Vendor.all
      end
    
      def new
        @vendor = Vendor.new
      end
      def show
        @vendor = Vendor.find(params[:id])
       
      end
      def create
        @vendor = Vendor.new(vendor_params)
        if @vendor.save
          redirect_to vendors_path, notice: "Vendor created successfully."
        else
          render :new
        end
      end
    
      def edit
        @vendor = Vendor.find(params[:id])
      end
    
      def update
        @vendor = Vendor.find(params[:id])
        if @vendor.update(vendor_params)
          redirect_to vendors_path, notice: "Vendor updated successfully."
        else
          render :edit
        end
      end
    
      def destroy
        @vendor = Vendor.find(params[:id])
        @vendor.destroy
        redirect_to vendors_path, notice: "Vendor deleted successfully."
      end
    
      private
    
      def vendor_params
   
        params.require(:vendor).permit( :company_name,:first_name, :email, :password,:telephone,:address)
      end 
end

