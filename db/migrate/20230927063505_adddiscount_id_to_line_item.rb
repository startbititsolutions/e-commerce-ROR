class AdddiscountIdToLineItem < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :discount_id, :integer
  end
end
