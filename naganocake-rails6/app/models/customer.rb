class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :addresses
  has_many :orders

   validates :family_name, presence: true
   validates :given_name, presence: true
   validates :family_name_kana, presence: true
   validates :given_name_kana, presence: true
   validates :zip_code, presence: true
   validates :address, presence: true
   validates :phone_number, presence: true
   validates :email, presence: true
   validates :encrypted_password, presence: true
  # def active_for_authentication?
  #   super && (is_deleted == true)
  # end

end
