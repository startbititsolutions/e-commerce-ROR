class CustomerProfileController < ApplicationController
    before_action :authenticate_user!
   
  #before_action :set_user, only: [:edit,:update,:show]

    def show
        
        @customer = current_customer
    end
  
    def edit
    # @user = User.find(params[:id])
    
        @customer = current_customer
      
    end
  
    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to root_path, notice: 'Profile updated successfully.'
      else
        render :edit
      end
    end
    def your_order
        
    end

    private
    def set_customer
        @customer= Customer.find(params[:id])
    end
  
    def customer_params
      params.require(:customer).permit(:name,:email, :password, :password_confirmation,:image)
    end
    
end

