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
    @discount= Discount.all
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

  def apply_discount
    @cart = current_cart
    @discount = Discount.all
    discount_code = params[:discount_code]
  
    matching_discount = @discount.find_by(code: discount_code)
  
    if matching_discount

      @cart.update(total: 0, u: false,all_total: 0)

      new_sub_total = @cart.sub_total - matching_discount.amount
  
      # Update the virtual sub_total attribute
      @cart.sub_total = new_sub_total

      # Update the cart's total and set u to true
      @cart.update(total: new_sub_total, u: true,all_total: @cart.sub_total)
  
      flash[:success] = "Discount applied successfully!"
    else
      flash[:error] = "Invalid discount code or product details."
    end
  
    redirect_to cart_path(@cart)
  end
  
end
