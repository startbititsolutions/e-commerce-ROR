class AddItemToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :all_total, :float
  end
end
