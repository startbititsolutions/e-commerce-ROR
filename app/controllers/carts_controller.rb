class CartsController < ApplicationController
  layout 'frontend'
  def show
    @cart = @current_cart
    @vendors = Vendor.all
    @productdetail = Productdetail.find(params[:id])
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
