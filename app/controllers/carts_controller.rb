class CartsController < ApplicationController
  layout 'frontend'
  def show
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
    @cart = @current_cart
    @vendors = Vendor.all
  
    @q = Productdetail.ransack(params[:q])
    @productdetails = @q.result(distinct: true)
  end

  def destroy

    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
