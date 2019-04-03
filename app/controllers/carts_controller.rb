class CartsController < ApplicationController
  def index
    @product_orders = current_order.product_orders
  end

  def destroy
    @product_order = ProductOrder.find_by id: params[:id]
    @product_order.destroy
  end
end
