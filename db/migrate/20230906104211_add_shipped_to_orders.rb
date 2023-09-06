class AddShippedToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :shipped, :boolean , default: false
    add_column :orders, :delivered, :boolean, default: false
    add_column :orders, :way, :boolean, default: false
  end
end
