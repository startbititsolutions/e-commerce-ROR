class LineItem < ApplicationRecord
    belongs_to :productdetail
    belongs_to :cart
    belongs_to  :order, optional: true
    # def total_price
    #   if cart.u == true 
     
    #     self.cart.line_items.each do |line_item|  
      
    #       productdetails1_ids = cart.productdetails1.map(&:to_i)
 
    #       if productdetails1_ids.include?(line_item.productdetail.id)
         
    #           return (quantity * productdetail.price - cart.dis_per)
            
    #       else
          
    #         if quantity && productdetail && productdetail.price
    #           return (quantity * productdetail.price)
    #         else
    #           0
    #         end
    #       end
    #     end
     
    #   else
    #     if quantity && productdetail && productdetail.price
    #       return quantity * productdetail.price
    #     else
    #       return 0
    #     end
    #   end
    # end

    def total_price
      total_price = 0
    
      if cart.u == true
        self.cart.line_items.each do |line_item|
          
          total_price = 0
          productdetails1_ids = cart.productdetails1.map(&:to_i)
       
          if productdetails1_ids.include?(line_item.productdetail.id) 
            if cart.amt_type =="percentage"

            return quantity * ( productdetail.price - productdetail.price * cart.dis_per / 100.0)
            else 
              return (quantity * productdetail.price - cart.dis_amt)  
            end
          else
            if quantity && productdetail && productdetail.price
              return (quantity * productdetail.price)
            else
             0
            end
          end 
          
        end
      else
     
          if quantity && productdetail && productdetail.price
               return  (quantity * productdetail.price)
          else
            0
          end
       
      end
    
    end
    # end
    def item_price
      if quantity && productdetail && productdetail.price
        return  (quantity * productdetail.price)
   else
     0
   end
    end
 
  
    
    
    
end

