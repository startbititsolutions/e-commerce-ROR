class CheckoutsController < ApplicationController
    layout 'frontend'

  before_action :current_cart
    def show
        current_customer.set_payment_processor :stripe
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      
     
        cart = @current_cart
    line_items = cart.line_items.includes(:productdetail)

    line_items_for_stripe = line_items.map do |line_item|
      {
        price_data: {
          currency: 'usd',
          product_data: {
            name: line_item.productdetail.product_title
          
          },
          unit_amount: (line_item.total_price * 100).to_i
         
      
        },
        quantity: line_item.quantity  
      }
    end

    total_amount = cart.sub_total * 100  


    @checkout_session = current_customer.payment_processor.checkout(
        payment_method_types: ['card'],
        line_items: line_items_for_stripe,
       
        allow_promotion_codes: true,
        mode: 'payment',
        success_url: success_url,
        cancel_url: checkout_url
      )
      
    end

        def success
            @total_amount_paid = StripeService.calculate_total_amount_paid
            @discount = Discount.all
            matching_discount = @discount.find_by(code: applied_discount)
            byebug
            if matching_discount && @current_cart.u == "true"
              byebug
             p= matching_discount.used
              matching_discount.update(used: p+1)
            end


            @order = Order.last
        
            @order.update(status: "paid")
            @order.update(fullfillment: "Unfullfilled")
            @order.update(total_amount: @total_amount_paid)
         
            @shipping_amount=40
             @current_cart.line_items.each do |item|
                    item.update(order_id: @order.id)  # Associate the line item with the order
     
     
                end
            @cart = @current_cart
            @cart.destroy
            session[:cart_id] = nil
            
          
        end

    def failuer

    end
   
end
