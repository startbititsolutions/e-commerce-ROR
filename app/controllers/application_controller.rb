class ApplicationController < ActionController::Base
  before_action :current_cart
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.has_role?(:admin)
      admin_root_path
    elsif resource.is_a?(Customer)
      
     root_path
    else
      root_path
    end
  end


  private
  def current_cart
    if current_customer
      # If the customer is logged in, associate the cart with the customer if it's not already associated.
      @current_cart ||= current_customer.cart || current_customer.create_cart
    else
      if session[:cart_id]
        # If there is a cart ID in the session, attempt to retrieve it.
        @current_cart = Cart.find_by(id: session[:cart_id])
  
        # If the cart is found and not associated with any customer, associate it with the logged-in customer.
        if @current_cart && !@current_cart.customer
          @current_cart.update(customer: current_customer)
        end
  
        # Clear the session cart ID if it's not found.
        session[:cart_id] = nil unless @current_cart
      end
  
      unless @current_cart
        # If no cart is found, create a new one and associate it with the logged-in customer if available.
        @current_cart = Cart.create(customer: current_customer)
        session[:cart_id] = @current_cart.id
      end
    end
  
    @current_cart
  end
  
  
 
    protected
    
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
    
  def after_confirmation_path_for(resource_name, resource)
    UserMailer.send_confirmation_instructions(resource).deliver_now
    
    root_path
  end
   
end
