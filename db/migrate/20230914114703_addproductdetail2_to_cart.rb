class Addproductdetail2ToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :productdetails1, :text, array: true, default: []
  end
end
