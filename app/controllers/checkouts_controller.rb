class CheckoutsController < ApplicationController
    layout 'frontend'

  before_action :current_cart
    def show
        current_customer.set_payment_processor :stripe
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      
     
        cart = current_customer.cart
    line_items = cart.line_items.includes(:productdetail)

    line_items_for_stripe = line_items.map do |line_item|
      {
        price_data: {
          currency: 'usd',
          product_data: {
            name: line_item.productdetail.product_title
          
          },
          unit_amount: (line_item.productdetail.price * 100).to_i
        },
        quantity: line_item.quantity
      }
    end

    total_amount = line_items.sum(&:total_price) * 100  # Total amount in 


    @checkout_session = current_customer.payment_processor.checkout(
        payment_method_types: ['card'],
        line_items: line_items_for_stripe,
        mode: 'payment',
        success_url: success_url,
        cancel_url: checkout_url
      )
      
    end

    def success
       
        @order = Order.last
    
         @order.update(status: "paid")
         @order.update(fullfillment: "Unfullfilled")
         @cart = current_customer.cart
         @shipping_amount=40
    end
    def failuer

    end
   
end
