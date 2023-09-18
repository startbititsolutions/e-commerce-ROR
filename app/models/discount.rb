class Discount < ApplicationRecord
  before_create :set_default_status
  belongs_to :customer, optional: true
  belongs_to :vendor, optional: true
  belongs_to :productdetail, optional: true
  validates :title, presence: true
  validates :code, presence: true
  validates :discount_type, presence: true
  
 
  private

  def set_default_status
    self.status ||= true
  end
end
