class ProductOrdersController < ApplicationController
  def index
    @product_orders = current_order.product_orders
  end

  def create
    @product_order = ProductOrder.new
    @order = current_order
    @product_order = @order.product_orders.build product_order_params
    if @order.save!
      session[:order_id] = @order.id
    end
  end

  def update
    @product_order = ProductOrder.find_by id: params[:id]
    quantity = @product_order.quantity
    if params[:type] == "inc"
      quantity.present? ? quantity += 1 : 0
    else
      quantity > 0 ? quantity -= 1 : 0
    end
    @product_order.update_attribute :quantity, quantity
    redirect_to carts_path
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
