class AddCarItemToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :item_price, :float
    add_column :carts, :total_item, :float
    add_column :carts, :total, :float
  end
end
