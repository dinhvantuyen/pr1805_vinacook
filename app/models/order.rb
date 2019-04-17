class Order < ApplicationRecord
  has_many :product_orders
  enum status: [:In_Progress, :Placed, :Shipped, :Cancelled]

  def subtotal
    product_orders.collect{ |po| po.valid? ? (po.quantity*po.product.price) : 0}.sum
  end

  def total_quantity
    product_orders.collect{ |po| po.valid? ? po.quantity : 0}.sum
  end

end
