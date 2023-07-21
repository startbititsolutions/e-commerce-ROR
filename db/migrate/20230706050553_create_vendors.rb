class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :telephone
      t.text :address

      t.timestamps
    end
    add_index :vendors, :email, unique: true
  end
end
