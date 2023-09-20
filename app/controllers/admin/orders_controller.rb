module Admin
class OrdersController < ApplicationController

  before_action :current_cart
  before_action :authenticate_user!  
 
  layout 'admin'
  def index
    @search = Order.ransack(params[:q])
    @orders = @search.result
   
   
    @shipping_amount=40
  end
  def edit
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
    y=@order.total_amount
 
    @total_amount_paid = StripeService.calculate_total_amount_paid
  
  
  end

  def new
    @order = Order.new
    @cart = current_customer.cart
    @shipping_amount=40
  end
  def create

    @order = Order.new(order_params)
    @order.customer = current_customer
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil  # Disassociate the line item from the cart
    end
  
    if @order.save
      # Create a new cart for the user
      new_cart = Cart.create
      session[:cart_id] = new_cart.id
  
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      render :new  
    end
  end
  def destroy
    @order =Order.find(params[:id])
    @order.destroy
    redirect_to admin_orders_path, notice: "order deleted successfully."

  end
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params) 
      redirect_to admin_order_path(@order), notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end
  
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address,:customer_id,:shipped,:delivered,:way)
    end
    def ransack_params
      params[:q] ||= {}
    end
end
end