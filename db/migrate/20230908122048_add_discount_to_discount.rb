class AddDiscountToDiscount < ActiveRecord::Migration[6.1]
  def change
    add_column :discounts, :amount_type, :string
  end
end
