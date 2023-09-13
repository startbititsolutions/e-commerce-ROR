class Discount < ApplicationRecord
  belongs_to :vendor, optional: true
  belongs_to :productdetail, optional: true
  belongs_to :customer, optional: true

  validates :title, presence: true
  validates :code, presence: true
  validates :discount_type, presence: true
  
end
