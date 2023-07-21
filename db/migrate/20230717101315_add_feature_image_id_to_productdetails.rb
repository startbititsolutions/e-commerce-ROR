class AddFeatureImageIdToProductdetails < ActiveRecord::Migration[6.1]
  def change
    add_column :productdetails, :feature_image_id, :integer
  end
end
