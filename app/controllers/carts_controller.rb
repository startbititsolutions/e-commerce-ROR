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

    if discount_code == 'remove_discount'

      @cart.update(
        u: false,
        dis_amt: 0,
        dis_per: 0,
        amt_type: " ",
        discount_type: " ",
        Applied_discount: " ",
        productdetails1: nil  
      )
  
      flash[:notice] = "Discount removed successfully!"
    else
      matching_discount = @discount.find_by(code: discount_code)
      if matching_discount.vendors1.empty?
        @cart.update(vendor_type: false)
      else
        @cart.update(vendor_type: true)
      end
  
      if matching_discount &&
         matching_discount.status &&
         matching_discount.start_date <= Date.today &&
         matching_discount.end_date >= Date.today &&
         (matching_discount.min_use.nil? || matching_discount.used <= matching_discount.min_use) &&
         (matching_discount.min_purchase_amount.nil? || matching_discount.min_purchase_amount <= @cart.sub_total) &&
         (matching_discount.min_purchase_quantity.nil? || matching_discount.min_purchase_quantity <= @cart.total_quantity)
  
        @cart.update(
          u: true,
          dis_amt: matching_discount.amount,
          dis_per: matching_discount.percentage,
          amt_type: matching_discount.amount_type,
          discount_type: matching_discount.discount_type,
          Applied_discount: matching_discount.code,
          productdetails1: matching_discount.productdetails1
         

        )
  
        flash[:notice] = "Discount applied successfully!"
      else
        flash[:error] = "Invalid discount code."
      end
    end
  
    redirect_to cart_path(@cart)
  end
  
  def remove_discount
    @cart = current_cart
    @cart.update(
        u: false,
        dis_amt: 0,
        dis_per: 0,
        amt_type: " ",
        discount_type: " ",
        Applied_discount: " ",
        vendor_type: false,
        productdetails1: nil  
      )
  
      flash[:notice] = "Discount removed successfully!"
      redirect_to cart_path(@cart)
  end
  
end
