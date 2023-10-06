require 'rails_helper'
RSpec.describe 'Coupon create', type: :system do
    it 'open coupon path' do
        visit admin_root_path

        fill_in 'user_email', with: 'supportntest@gmail.com'
        sleep(1)
          fill_in 'user_password', with: 123456
        sleep(1)
          click_button 'Log in'
          click_on 'Create Coupon'
          fill_in 'Coupon Name', with: 'Aditya test1'
          fill_in 'code', with: 'Aditya800'
          fill_in 'Percent Off', with: '30%'
          click_button 'Create Coupon'
          visit admin_coupons_path

    end
end