class ApplicationController < ActionController::Base
  before_action :current_cart
  # before_action :set_locale
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.has_role?(:admin)
      admin_root_path
    elsif resource.is_a?(Customer)
      
     root_path
    else
      root_path
    end
  end

  def set_locale

    I18n.locale = extract_locale || I18n.default_locale
  end


  private
  def current_cart
    if current_customer
    
      if session[:cart_id]
        @current_cart = Cart.find_by(id: session[:cart_id])
        @current_cart.update(customer: current_customer) if @current_cart && @current_cart.customer.blank?
      end
  
      # If the customer has an existing cart, use it; otherwise, create a new cart.
      @current_cart ||= current_customer.cart || Cart.create(customer: current_customer)
    else
      # If the user is not logged in, use the session cart logic you've implemented.
      if session[:cart_id]
        cart = Cart.find_by(id: session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end
  
      if session[:cart_id].nil?
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
  
    @current_cart
  end
  def default_url_options
    {locale: I18n.locale}
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end

  
  
  
 
    protected
    
    
    
  def after_confirmation_path_for(resource_name, resource)
    UserMailer.send_confirmation_instructions(resource).deliver_now
    
    new_user_session_path
  end
   
end
