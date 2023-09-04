module Admin
class OrdersController < ApplicationController

  before_action :current_cart
  before_action :authenticate_user!  
 
  layout 'admin'
  def index
    @search = Order.ransack(params[:q])
    @orders = @search.result
   
    
    @cart = current_customer.cart
    @shipping_amount=40
  end

  def show
    @order = Order.find(params[:id])
    @cart = current_customer.cart
    @shipping_amount=40
  end

  def new
    @order = Order.new
    @cart = current_customer.cart
    @shipping_amount=40
  end
  def create
    byebug
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
  
  
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address,:customer_id)
    end
    def ransack_params
      params[:q] ||= {}
    end
end
end