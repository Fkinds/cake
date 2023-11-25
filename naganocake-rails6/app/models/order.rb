class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  # validates :name, presence: true
  # validates :address, presence: true
  # validates :zip_code, presence: true
  
  
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    配送済み: 4
  }

end
