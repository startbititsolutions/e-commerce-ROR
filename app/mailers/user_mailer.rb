class UserMailer < Devise::Mailer
    default from: 'your_email@example.com' # Replace with the email address you want the email to be sent from

    def send_confirmation_instructions(user)
      @user = user
      mail(to: @user.email, subject: 'Confirm your account')
    end
   

    def confirmation_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :confirmation_instructions, opts)
    end
end
