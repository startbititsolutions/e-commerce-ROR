class Customer < ApplicationRecord
  has_many :orders
  has_one  :cart
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         pay_customer stripe_attributes: :stripe_attributes

  def create_cart
  cart = Cart.create(customer: self)
  update(cart: cart)
  cart
end  
 def stripe_attributes(pay_customer)
  {
    address: {
      city: pay_customer.owner.city,
      country: pay_customer.owner.country
    },
    metadata: {
      pay_customer_id: pay_customer.id,
      customer_id: id
    }
  }
end
end
