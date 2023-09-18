class AddAppliedDiscountToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :Applied_discount, :string
  end
end
