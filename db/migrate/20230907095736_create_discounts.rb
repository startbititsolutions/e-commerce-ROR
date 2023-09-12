class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :title
      t.boolean :status
      t.string :discount_type
      t.float :used
      t.string :code
      t.float :amount
      t.float :percentage
      t.float :min_purchase_amount
      t.float :min_purchase_quantity
      t.date :start_date
      t.date :end_date
      t.integer :min_use
      t.references :vendor, null: true, foreign_key: true, optional: true
      t.references :productdetail, null: true, foreign_key: true, optional: true
      t.references :customer, null: true, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
