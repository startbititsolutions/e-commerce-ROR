class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.integer :productdetail_id
      t.integer :cart_id
   

      t.timestamps
    end
  end
end
