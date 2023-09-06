module Admin
class CouponsController < ApplicationController
  layout 'admin'
      before_action :authenticate_user!
  
    def index
        Stripe.api_key = 'sk_test_51NkQmqBmFMBRRenabOm23pEYYG1oiM3BnMLRodHkCw8rvImbvdRyFL6gY8NLVV6PMpfs2fsBDFwwyQNL2Rzn7B0K00vqTjNulq'
      
        begin
        
          @coupons = Stripe::Coupon.list
      
          
          @promotion_codes = {}
      
         
          @coupons.each do |coupon|
            promotion_codes = Stripe::PromotionCode.list({ coupon: coupon.id, limit: 3 })
            @promotion_codes[coupon.id] = promotion_codes.data
          end
        rescue Stripe::StripeError => e
          flash[:error] = e.message
        end
      end
      
      def create
        Stripe.api_key = 'sk_test_51NkQmqBmFMBRRenabOm23pEYYG1oiM3BnMLRodHkCw8rvImbvdRyFL6gY8NLVV6PMpfs2fsBDFwwyQNL2Rzn7B0K00vqTjNulq'
      
        begin
          coupon = Stripe::Coupon.create({
            name: params[:coupon_name],
            percent_off: params[:percent_off],
            duration: params[:duration],
          })
      
          @coupon = coupon
      
          # Create a PromotionCode with a custom name
          promotion_code = Stripe::PromotionCode.create({
            coupon: @coupon.id,  
            
            code: params[:promotion_code_name]  # Custom name for the promotion code
          })
      
          flash[:success] = "Coupon and Promotion Code created successfully!"
        rescue Stripe::StripeError => e
          flash[:error] = e.message
        end
        redirect_to admin_coupons_path
      end
     
      def destroy
        begin
          coupon = Stripe::Coupon.retrieve(params[:id])
          coupon.delete
      
          flash[:success] = "Coupon deleted successfully!"
        rescue Stripe::StripeError => e
          flash[:error] = e.message
        end
      
        redirect_to admin_coupons_path
      end
      
      def edit
        begin
          @coupon = Stripe::Coupon.retrieve(params[:id])
        rescue Stripe::StripeError => e
          flash[:error] = e.message
          redirect_to admin_coupons_path
        end
      end
      def update
        begin
          @coupon = Stripe::Coupon.retrieve(params[:id])
      
          # Update the coupon attributes based on form input
          @coupon.name = params[:coupon_name]
          @coupon.percent_off = params[:percent_off]
          @coupon.duration = params[:duration]
          @coupon.save
      
          flash[:success] = "Coupon updated successfully!"
        rescue Stripe::StripeError => e
          flash[:error] = e.message
        end
      
        redirect_to admin_coupons_path
      end
      
      
      
    def new 
        @coupon = Coupon.new
    end
  end
end 