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
   
        applied_discount =   sum-self.total
        
        sum = sum-applied_discount
        
      end
    
      return sum
    end
  

end
