  require 'rails_helper'

#   RSpec.describe 'Static content', type: :system do
#     it 'shows the static text' do
#       visit admin_root_path

#       # Add a delay of 5 seconds
#       sleep(1)

      
      
#   #     fill_in 'user_email', with: 'ksenia123@gmail.com'
#   #    fill_in 'user_password', with: '123456'
#   #  fill_in 'user_password_confirmation', with: '12345'
#       fill_in 'user_email', with: 'supportntest@gmail.com'
#       fill_in 'user_password', with: 'wrong_password'
#       click_button 'Log in'
   

# expect(page).to have_content('Invalid Email or password.')


#       fill_in 'user_email', with: 'supportntest@gmail.com'
#     sleep(1)
#       fill_in 'user_password', with: 123456
#     sleep(1)
#       click_button 'Log in'
      
#       expect(page).to have_content('hellow admin')
#     end
#   end
  
 
# require 'rails_helper'

# RSpec.describe 'Static content', type: :system do
#   it 'shows the static text' do
#     # Stub the authentication process to allow or deny login
#     allow_any_instance_of(User).to receive(:valid_password?).and_return(true) 
#     # Or you can stub it to deny login:
#     allow_any_instance_of(User).to receive(:valid_password?).and_return(false)

#     visit admin_root_path

#     fill_in 'user_email', with: 'supportntest@gmail.com'
#     fill_in 'user_password', with: '123456'
#     click_button 'Log in'

#     expect(page).to have_content('hellow admin')
#   end
# end

 # spec/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'POST #create' do
    it 'logs in successfully' do
      user = create(:user, email: 'supportntest@gmail.com', password: '123456')

      post :create, params: { user: { email: 'test@example.com', password: 'password123' } }

      # Expect a successful login, which typically results in a redirect or other behavior
      expect(response).to have_http_status(:redirect) # Adjust this expectation based on your actual behavior

      # You can also check for other conditions, such as the user being signed in:
      expect(controller.current_user).to eq(user)
    end

    it 'fails to log in with incorrect credentials' do
      post :create, params: { user: { email: 'test@example.com', password: 'wrong_password' } }

      # Expect a failed login, which typically results in a redirect or error message display
      expect(response).to have_http_status(:redirect) # Adjust this expectation based on your actual behavior

      # You can check for an error message or any other relevant conditions here
    end
  end
end
