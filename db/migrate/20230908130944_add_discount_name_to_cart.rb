class AddDiscountNameToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :discount_name, :string
    add_column :carts, :discount_type, :string
  end
end
