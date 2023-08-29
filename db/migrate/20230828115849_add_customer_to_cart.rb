class AddCustomerToCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :customer, null: true, foreign_key: true
  end
end
