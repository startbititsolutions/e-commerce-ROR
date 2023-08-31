class AddBillingLocationToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :city, :string
    add_column :customers, :country, :string
  end
end
