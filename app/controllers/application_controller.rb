class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      admin_root_path
    else
      # Add the path where you want to redirect non-admin users after sign-in
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
