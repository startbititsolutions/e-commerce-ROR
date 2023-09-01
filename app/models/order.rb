class Order < ApplicationRecord
    belongs_to  :customer
    has_many :line_items, dependent: :destroy
 
    def self.ransackable_attributes(auth_object = nil)
        %w[ order_id name customer line_items address alternate_mobile city country created_at customer_id email fullfillment id mobile name note order_number pincode shipping_amount status tax updated_at line_items_sum_total]
        
    end
end
