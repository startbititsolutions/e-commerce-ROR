class AddDiscountItemPriceToLineItem < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :discount_item_price, :float
    add_column :line_items, :product_item_price, :float
  end
end
