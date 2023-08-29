class Shipping < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.string :tracking_number
      t.datetime :actual_delivery_date
      t.string :shipping_method
      t.timestamps
    end
  end
end
