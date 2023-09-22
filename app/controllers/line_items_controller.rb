class LineItemsController < ApplicationController
  before_action :current_cart
    def create
  
        chosen_product = Productdetail.find(params[:productdetail_id])
       
        current_cart = @current_cart
      
       
        if current_cart.productdetail.include?(chosen_product)
        
          @line_item = current_cart.line_items.find_by(:productdetail_id => chosen_product)
       
          @line_item.quantity = (@line_item.quantity || 0) + 1
        else
    
          @line_item = LineItem.new
          @line_item.cart = current_cart
          @line_item.productdetail = chosen_product
          @line_item.quantity = 1
        end
      

        @line_item.save
     
        flash[:notice] = "✓ Item added to cart successfully."


        redirect_to product_path(chosen_product)
       
    
    end
   
    def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy
        redirect_to cart_path(@current_cart)
    end  

    def add_quantity
        @line_item = LineItem.find(params[:id])
        @line_item.quantity += 1
        @line_item.save
        redirect_to cart_path(@current_cart)
    end
      
    def reduce_quantity
        @line_item = LineItem.find(params[:id])
        if @line_item.quantity > 1
            @line_item.quantity -= 1
        end
    @line_item.save
    redirect_to cart_path(@current_cart)
    end
    def update_quantity
    
        @line_item = LineItem.find(params[:id])
        new_quantity = params[:quantity].to_i
        if new_quantity > 0
          @line_item.update(quantity: new_quantity)
        end
    
        respond_to do |format|
          format.json do
            render json: {
              quantity: @line_item.quantity,
              
              total_price: @line_item.total_price,
              total_item:  @line_item.item_price,
              cart_total: @line_item.cart.sub_total,
              total_item_total: @line_item.cart.total_item_total,
              discount_price: @line_item.discount_price
              
            }
          end
          format.html do
            redirect_to cart_path(@current_cart)
          end
        end
      end




      private
        def line_item_params
          params.require(:line_item).permit(:quantity,:productdetail_id, :cart_id)
        end
end
