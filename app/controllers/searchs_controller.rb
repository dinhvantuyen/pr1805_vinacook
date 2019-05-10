class SearchsController < ApplicationController

  def show
    @products = Product.all
    if params[:code] == "1"
      @products = Product.where("price <= 100")
    elsif params[:code] == "2"
      @products = Product.where("price > 100").where("price <= 200")
    elsif params[:code] == "3"
      @products = Product.where("price > 200").where("price <= 400")
    else
      @products = Product.where("price > 400")
    end
    @products = @products.paginate page: params[:page], per_page: 10
    @product_order = current_order.product_orders.build
  end

end
