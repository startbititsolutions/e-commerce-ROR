class AddCurrencyToProductdetails < ActiveRecord::Migration[6.1]
  def change
    add_column :productdetails, :currency, :string
  end
end
