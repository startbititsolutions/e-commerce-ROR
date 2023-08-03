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
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
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
