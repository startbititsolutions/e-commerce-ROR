class Cart < ApplicationRecord
 
    has_many :line_items
    has_many :productdetail, through: :line_items
    belongs_to :customer, optional: true
    attr_accessor :sub_total
    # LOGIC
     
    def sub_total
      sum = 0
      vendor_discount = 0
      vendor_not_discount = 0
      if self.vendor_type == false
        self.line_items.each do |line_item|
          sum += line_item.total_price
          byebug
        end

      else
     
        self.line_items.each do |line_item|
          productdetails1_ids = self.productdetails1.map(&:to_i)

          if productdetails1_ids.include?(line_item.productdetail_id)
         
         
              vendor_discount += line_item.total_price 
             
            

   
           
          else
            
            vendor_not_discount += line_item.total_price
           

          end
           if self.amt_type == "amount"
          
            sum =  (vendor_discount - self.dis_amt) + vendor_not_discount
           
           else
            
            sum =  (vendor_discount - ( vendor_discount * self.dis_per / 100.0)) + vendor_not_discount
           end
        end
      end
        
      
      if self.u
     
        if self.amt_type == "amount" && self.discount_type == "amount_on_order"
          
          applied_discount = sum - self.dis_amt
         
           return applied_discount
          
        elsif self.amt_type == "percentage" && self.discount_type == "amount_on_order"
          applied_discount = sum - (sum * (self.dis_per / 100.0))
         return applied_discount
        else
          return sum
        end
        
      end
      return sum
    end
  
 def total_item_total
  sum =0
  self.line_items.each do |line_item|
    sum += line_item.item_price
  end
  return sum

 end
    def total_quantity
      p=0
      self.line_items.each do |line_items|
        p+= line_items.quantity
      end
      return p
    end
end
