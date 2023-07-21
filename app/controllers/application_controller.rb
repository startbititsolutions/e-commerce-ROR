class ApplicationController < ActionController::Base
    
    protected

  def after_confirmation_path_for(resource_name, resource)
    UserMailer.send_confirmation_instructions(resource).deliver_now
    # Replace 'UserMailer' with the actual name of your mailer if you used a different one
    # The 'deliver_now' method sends the email immediately. You can also use 'deliver_later' for background processing with Active Job.
    # Make sure to return the desired path after the email is sent, e.g., root_path or dashboard_path.
    # For this example, we'll return the root path.
    root_path
  end
   
end
