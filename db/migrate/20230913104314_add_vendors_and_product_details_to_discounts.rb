class AddVendorsAndProductDetailsToDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_column :discounts, :vendors1, :text,  array: true, default: []
    add_column :discounts, :productdetails1, :text, array: true, default: []
  end
end
