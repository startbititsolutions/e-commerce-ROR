class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.has_role?(:admin)
      admin_root_path
    elsif resource.is_a?(Customer)
      
     root_path
    else
      root_path
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
