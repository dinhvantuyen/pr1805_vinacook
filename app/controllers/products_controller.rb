class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:search_name].present? && params[:category_id].present?
      @products = @products.search_product_name params[:search_name], params[:category_id]
      flash[:info] = "Không có sản phẩm nào được tìm thấy!" if @products.empty?
    elsif params[:search_name].present?
      @products = @products.search_name params[:search_name]
      flash[:info] = "Không có sản phẩm nào được tìm thấy!" if @products.empty?
    elsif params[:category_id].present?
      @products = @products.search_product_category params[:category_id]
      flash[:info] = "Không có sản phẩm nào được tìm thấy!" if @products.empty?
    else
     flash[:warning] = "Bạn phải điền tên sản phẩm hoặc chọn danh mục!"
     redirect_to root_url
    end
    @categories_for_search = Category.pluck :name, :id
    @products = @products.paginate page: params[:page], per_page: 10
    @product_order = current_order.product_orders.build
  end

  def show
    @product = Product.find_by id: params[:id]
    @best_products = Product.best_product.limit 4
    @categories = Category.limit 5
    @review = Review.new
    @avg_rate = @product.reviews.average(:rate)&.round(2) || 0
  end

end
