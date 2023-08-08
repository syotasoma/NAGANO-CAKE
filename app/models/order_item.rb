class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item
  def subtotal
  item.with_tax_price * amount
  end
end
