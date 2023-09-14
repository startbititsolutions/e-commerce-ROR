class AddDiscountTypeToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :discount_type12, :string
  end
end
