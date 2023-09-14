class AddAmountTypeToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :amt_type, :string
  end
end
