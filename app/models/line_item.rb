class LineItem < ApplicationRecord
    belongs_to :productdetail
    belongs_to :cart
    belongs_to  :order, optional: true
    def total_price
      if cart.u == true 
        total_price = 0
        self.cart.line_items.each do |line_item|  
          if cart.productdetails1.include?(line_item.productdetail)
      byebug
            if quantity && productdetail && productdetail.price
              total_price += (quantity * productdetail.price - cart.dis_per)
            else
              total_price += 0
            end
          else
            
            if quantity && productdetail && productdetail.price
              total_price += (quantity * productdetail.price - cart.dis_per)
            else
              total_price += 0
            end
          end
        end
        return total_price
      else
        if quantity && productdetail && productdetail.price
          return quantity * productdetail.price
        else
          return 0
        end
      end
    end
    
    
end

