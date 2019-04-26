class ProductsController < ApplicationController

  def show
    @product = Product.find_by id: params[:id]
    @best_products = Product.best_product.limit 4
    @categories = Category.limit 5
    @review = Review.new
    @avg_rate = @product.reviews.average(:rate)&.round(2) || 0
  end

end
