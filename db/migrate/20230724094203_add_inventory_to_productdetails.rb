class AddInventoryToProductdetails < ActiveRecord::Migration[6.1]
  def change
    add_column :productdetails, :inventory, :integer
  end
end
