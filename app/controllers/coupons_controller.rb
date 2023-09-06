class CouponsController < ApplicationController
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
         duration:  params[:duration],
    
        })
  
        @coupon = coupon
        Stripe::PromotionCode.create({coupon:  @coupon})
      rescue Stripe::StripeError => e
    
        flash[:error] = e.message
      end
    end

    def new 
        @coupon = Coupon.new
    end
  end
  