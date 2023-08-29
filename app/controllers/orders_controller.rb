class OrdersController < ApplicationController
  before_action :current_cart
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
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
  
  
  
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address,:customer_id)
    end
end