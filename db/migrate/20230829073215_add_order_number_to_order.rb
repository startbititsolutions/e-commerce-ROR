class AddOrderNumberToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_number, :float
    add_column :orders, :tax, :float
    add_column :orders, :shipping_amount, :float
  end
end
