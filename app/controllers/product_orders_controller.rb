class ProductOrdersController < ApplicationController

  def create
    @product_order = ProductOrder.new
    @order = current_order
    @product_order = @order.product_orders.build product_order_params
    if @order.save!
      session[:order_id] = @order.id
    end
  end

  def destroy
    @order = current_order
    @product_order = ProductOrder.find_by params[:id]
    @product_order.destroy
    @product_orders = @order.product_orders
  end

  private

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id)
  end

end
