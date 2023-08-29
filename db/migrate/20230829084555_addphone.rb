class Addphone < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :alternate_mobile, :string
    add_column :orders, :mobile, :string

  end
end
