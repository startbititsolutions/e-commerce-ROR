class AddItemsToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :total_quantity, :integer
    add_column :carts, :min_use, :integer , default: 0
  end
end
