class OrdersController < ApplicationController
  def update
    current_order.product_orders.each do |product_order|
      product = Product.find_by id: product_order.product.id
      quantity = product.quantity - product_order.quantity
      if quantity > 0
        product.update_attribute :quantity, quantity
      else
        flash[:warning] = "San pham #{product_order.product.name} da het hang!"
        redirect_to(checkouts_path) and return
      end
    end
    subtotal = current_order.subtotal
    current_order = Order.create session[:address_review]
    current_order.update_attribute :subtotal, subtotal
    OrderMailer.order_email(session[:address_review]["email"]).deliver_now
    checkout_complete
    redirect_to new_orders_path
  end

end
