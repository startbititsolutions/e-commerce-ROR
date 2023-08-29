class LineItem < ApplicationRecord
    belongs_to :productdetail
    belongs_to :cart
    belongs_to  :order, optional: true
    def total_price
        
        if quantity && productdetail && productdetail.price
          quantity * productdetail.price
        else
          0
        end
      end
end

