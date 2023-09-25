class Address < ApplicationRecord
  belongs_to :customer

  def address_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end
end
