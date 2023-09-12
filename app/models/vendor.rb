class Vendor < ApplicationRecord
    has_many :productdetail, dependent: :destroy
    has_many :discounts
    def self.ransackable_attributes(auth_object = nil)
        %w[address company_name created_at email first_name id last_name telephone updated_at]
      end
end
