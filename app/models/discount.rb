class Discount < ApplicationRecord
  belongs_to :vendor
  belongs_to :productdetail
  belongs_to :customer
end
