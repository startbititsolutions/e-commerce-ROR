class CreateProductdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :productdetails do |t|
      t.string :product_title
      t.string :brand
      t.float :price
      t.float :list_price
      t.text :description
      t.string :sku
      t.text :tags
      t.string :product_type
      t.boolean :status
      t.string :meta_title
      t.text :meta_description
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
