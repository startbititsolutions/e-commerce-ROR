class AddOrderdetailcolumnToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :country, :string
    add_column :orders, :city, :string
    add_column :orders, :pincode, :string
  end
end
