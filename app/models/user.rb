class User < ApplicationRecord
  has_one_attached :image
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
         after_create :assign_default_role

         def assign_default_role
           self.add_role(:vendor) if self.roles.blank?
         end    
        
end
