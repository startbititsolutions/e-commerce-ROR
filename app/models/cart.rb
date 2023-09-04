class Cart < ApplicationRecord
    has_many :line_items
    has_many :productdetail, through: :line_items
    belongs_to :customer, optional: true
   
    # LOGIC
    def sub_total
      sum = 0
      self.line_items.each do |line_item|
        sum+= line_item.total_price
      end
      return sum
    end
end
