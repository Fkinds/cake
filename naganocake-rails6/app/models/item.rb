class Item < ApplicationRecord
  belongs_to  :genre
  has_many :cart_item
  has_many :order_details

  has_one_attached :image

  def get_item_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def tax_price
    (self.price*1.1).round
  end

  def self.search(search)
    if search != ""
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end
end
