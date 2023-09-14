class AddDiscountAmountAndDiscountProductToDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :dis_amt, :float
    add_column :carts, :dis_per, :float
  end
end
