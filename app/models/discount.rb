class Discount < ApplicationRecord
  before_create :set_default_status
  belongs_to :customer, optional: true
  belongs_to :vendor, optional: true
  belongs_to :productdetail, optional: true
  validates :title, presence: true
  validates :code, presence: true
  validates :discount_type, presence: true
  validate :code_format
  validates :productdetails1, presence: { any: true, message: "must have at least one element" }

  #validates :productdetails1, presence:true
  # validates :start_date, presence: true, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/, message: "must be in the format dd/mm/yyyy" }
  #validates :end_date, presence: true, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/, message: "must be in the format dd/mm/yyyy" }
  #validates :start_date, presence: true, format: { with: /\A\d{1,2}\/\d{1,2}\/\d{4}\z/, message: "must be in the format dd/mm/yyyy" }
  #validates :end_date, presence: true, format: { with: /\A\d{1,2}\/\d{1,2}\/\d{4}\z/, message: "must be in the format dd/mm/yyyy" }
  validate :validate_date_format
  def schedule_delete
   self.delete
  end
  
  
  def self.scheduled_discount
    d=Discount.last
    d.delete
   end
  def validate_date_format
    if start_date.present? && !valid_date_format?(start_date)
      errors.add(:start_date, "must be in the format dd/mm/yyyy")
    end

    if end_date.present? && !valid_date_format?(end_date)
      errors.add(:end_date, "must be in the format dd/mm/yyyy")
    end
  end
  private

  def set_default_status
    self.status ||= true
  end
  def code_format
    unless code =~ /\A[A-Z0-9][a-zA-Z0-9]{4,9}\z/
      errors.add(:code, "should start with an uppercase letter or digit and have a length between 5 and 10 characters")
    end
  end
  def valid_date_format?(date)

    date.is_a?(Date) rescue false
  end
end
