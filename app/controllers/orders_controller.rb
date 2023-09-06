
class OrdersController < ApplicationController

  before_action :current_cart


  def index
    @orders = Order.all
    @cart = current_customer.cart
    @shipping_amount=40
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart = current_customer.cart
    @shipping_amount=40
  end
  def edit
    @order = Order.find(params[:id])
  

  end
  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @current_cart.line_items.each do |item|
      @order.line_items << item
    
    end

    if @order.save
      @current_cart.line_items.each do |item|
        item.update(order_id: @order.id)  # Associate the line item with the order
     
     
      end
    
     
      redirect_to checkout_path 
  
     
    else
      render :new  
    end
  end
  
  def index_for_current_customer
    @total_amount_paid = StripeService.calculate_total_amount_paid
    @orders = current_customer.orders
    @cart = current_customer.cart
    @shipping_amount = 40

    # Render the view for displaying orders
    render 'index_for_current_customer' 
  end
  
  
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address,:customer_id,:note,:city,:country,:pincode,:alternate_mobile,:mobile)
    end
end
