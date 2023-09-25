class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def payment
    ((self.item.price*1.1)*(self.amount)).round
  end

end
