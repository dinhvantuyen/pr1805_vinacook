class StaticPagesController < ApplicationController

  def home
    @products = Product.order("created_at desc").paginate(page: params[:page], per_page: 10)
    @best_products = Product.best_product.limit 3
  end

  def help; end
end
