json.extract! discount, :id, :title, :status, :discount_type, :used, :code, :amount, :percentage, :min_purchase_amount, :min_purchase_quantity, :start_date, :end_date, :min_use, :vendor_id, :productdetails_id, :customer_id, :created_at, :updated_at
json.url discount_url(discount, format: :json)
