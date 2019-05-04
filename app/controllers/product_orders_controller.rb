class ProductOrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @product_orders = current_order.product_orders
  end

  def create
    @product_order = ProductOrder.new
    @order = current_order
    product_order = @order.product_orders.find_by product_id: params[:product_order][:product_id]
    if product_order.present?
      product_order.quantity += 1
      product_order.update_attribute :quantity, product_order.quantity
    else
      @product_order = @order.product_orders.build product_order_params
    end
    if @order.save!
      session[:order_id] = @order.id
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @product_order = ProductOrder.find_by id: params[:id]
    @product_order.update product_order_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @order = current_order
    @product_order = ProductOrder.find_by id: params[:id]
    @product_order.destroy
    @product_orders = @order.product_orders
    redirect_to root_url
  end

  private

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id)
  end

end
