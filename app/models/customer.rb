class Customer < ApplicationRecord
  has_many :orders
  has_one  :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_cart
  cart = Cart.create(customer: self)
  update(cart: cart)
  cart
end  

end
