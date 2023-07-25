json.extract! productdetail, :id, :product_title, :brand, :price, :list_price, :description, :sku, :tags, :product_type, :status, :meta_title, :meta_description, :vendor_id, :created_at, :updated_at
json.url productdetail_url(productdetail, format: :json)
