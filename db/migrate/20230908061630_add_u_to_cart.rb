class AddUToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :u, :boolean, default:false
  end
end
