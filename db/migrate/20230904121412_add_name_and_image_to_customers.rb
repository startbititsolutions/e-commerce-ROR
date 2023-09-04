class AddNameAndImageToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :name, :string
    add_column :customers, :image, :string
  end
end
