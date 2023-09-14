class Cart < ApplicationRecord
 
    has_many :line_items
    has_many :productdetail, through: :line_items
    belongs_to :customer, optional: true
    attr_accessor :sub_total
    # LOGIC
    def sub_total
      sum = 0
      self.line_items.each do |line_item|
        sum += line_item.total_price
      end
        
      
      if self.u
        if self.amt_type == "amount" && self.discount_type == "amount_on_order"
   
          applied_discount =   sum-self.dis_amt
          
          sum = applied_discount
        else 
          applied_discount =   sum - (sum * (self.dis / 100.0))
          sum = applied_discount
        end
      end
      return sum
    end
  

end
