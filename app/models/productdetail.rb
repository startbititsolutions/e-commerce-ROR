  class Productdetail < ApplicationRecord
    
    #has_one_attached :image
    
    has_many_attached :images, dependent: :destroy
    belongs_to :vendor
    has_many :line_items, dependent: :destroy
    
    validates :product_title, presence: true
    validates :brand, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :list_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :description, presence: true
    validates :sku, presence: true
    validates :tags, presence: true
    validates :product_type, presence: true
    validates :status, inclusion: { in: [true, false] }
    validates :meta_title, presence: true
    validates :meta_description, presence: true
    has_rich_text :description
    #has_rich_text :meta_description
    
    def feature_image
      images.find_by(id: feature_image_id)
    end
  
    def self.ransackable_attributes(auth_object = nil)
      %w[brand created_at description id list_price meta_description meta_title price product_title product_type sku status tags updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
      %w[vendor]
    end
    
  end
