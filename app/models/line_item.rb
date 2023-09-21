class LineItem < ApplicationRecord
    belongs_to :productdetail
    belongs_to :cart
    belongs_to  :order, optional: true
    

  def total_price
    if cart.u == true
      productdetails1_ids = cart.productdetails1.map(&:to_i)

      if productdetails1_ids.include?(productdetail_id)
        
        if cart.amt_type =="percentage"
          return quantity * ( productdetail.price - productdetail.price * cart.dis_per / 100.0)
        else 
           result = (quantity * productdetail.price - cart.dis_amt)
           return  result < 0 ? 0 : result


 
        end
      else
        
        if quantity && productdetail && productdetail.price
          return (quantity * productdetail.price)
        else
          0
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
    
    def item_price
      if quantity && productdetail && productdetail.price
        return  (quantity * productdetail.price)
      else
      0
      end
    end
 
  
    
    
    
end

