class AddImageToProductdetails < ActiveRecord::Migration[6.1]
  def change
    add_column :productdetails, :image, :string
  end
end
