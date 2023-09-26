class AddSlugToProductdetails < ActiveRecord::Migration[6.1]
  def change
    add_column :productdetails, :slug, :string
    add_index :productdetails, :slug, unique: true
  end
end
