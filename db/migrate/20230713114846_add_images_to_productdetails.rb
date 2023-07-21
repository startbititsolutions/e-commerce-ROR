class AddImagesToProductdetails < ActiveRecord::Migration[6.1]
  def change
    def change
      add_column :productdetails, :images, :json
  
      Productdetails.reset_column_information
      Productdetails.all.each do |product_detail|
        product_detail.images = [product_detail.image] if product_detail.image.present?
        product_detail.save!
      end
  
      remove_column :productdetails, :image
    end
  end
end
