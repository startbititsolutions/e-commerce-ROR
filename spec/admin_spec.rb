  require 'rails_helper'

  RSpec.describe 'Static content', type: :system do
    it 'shows the static text' do
      visit admin_root_path

      # Add a delay of 5 seconds
      sleep(4)

      
      
      
      fill_in 'user_email', with: 'adityajain123@gmail.com'
    sleep(4)
      fill_in 'user_password', with: 123456
    sleep(4)
      click_button 'Log in'

      expect(page).to have_content('hellow admin')
    end
  end
