class CheckoutsController < ApplicationController
    layout 'frontend'

  before_action :current_cart
    def show
        current_customer.set_payment_processor :stripe
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      
     
        cart = @current_cart
    line_items = cart.line_items.includes(:productdetail)
    if cart.u
  
       if cart.discount_type == "amount_on_product" 
        
              line_items_for_stripe = line_items.map do |line_item|
              
                {
                  price_data: {
                    currency: 'usd',
                    product_data: {
                      name: line_item.productdetail.product_title
                    
                    },
                    unit_amount: (line_item.total_price * 100).to_i
                
                  },
                  quantity: 1
                }
              end
          
          total_amount = cart.sub_total * 100  
        else
            line_items_for_stripe = line_items.map do |line_item|
        
              {
                price_data: {
                  currency: 'usd',
                  product_data: {
                    name: line_item.productdetail.product_title
                  
                  },
                  unit_amount: (line_item.total_price * 100).to_i,
                  
              
                },
                quantity: 1
              }
            end
        
          total_amount = cart.sub_total- cart.dis_amt * 100  
      
        end

    else
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
  
       total_amount = cart.sub_total * 100  
    end




    @checkout_session = current_customer.payment_processor.checkout(
        payment_method_types: ['card'],
        line_items: line_items_for_stripe,
       
        allow_promotion_codes: true,
        mode: 'payment',
        success_url: success_url,
        cancel_url: checkout_url,
       
      )
      
      
    end

        def success
      
            @total_amount_paid = StripeService.calculate_total_amount_paid
            @discount = Discount.all
            matching_discount = @discount.find_by(code: @current_cart.Applied_discount)
           
            if @current_cart.u 
              
            
              p = matching_discount.used.to_i + 1

           
              matching_discount.update(used: p)
            end 


            @order = Order.last
            
            @order.update(status: "paid")
            @order.update(fullfillment: "Unfullfilled")
            @order.update(total_amount: @total_amount_paid)
         
            @shipping_amount=40
             @current_cart.line_items.each do |item|
                    item.update(order_id: @order.id)  
              
     
                end
            @cart = @current_cart
            @cart.destroy
            session[:cart_id] = nil
            respond_to do |format|
              format.html
              format.pdf do
                pdf = render_to_string pdf: "Order_#{@order.id}_Invoice",
                                       template: "checkouts/success.html.erb",
                                       formats: [:html],
                                       layout: 'pdf'
                
               
                OrderMailer.order_confirmation(@order, pdf).deliver_now
              
             
                render pdf: "Order_#{@order.id}_Invoice",
                       template: "checkouts/success.html.erb",
                       formats: [:html],
                       disposition:  'attachment',
                       layout: 'pdf'
              end
              


            end
            
          
        end

    def failuer
      byebug

    end
   
end
