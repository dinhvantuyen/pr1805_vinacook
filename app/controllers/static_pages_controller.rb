class StaticPagesController < ApplicationController

  def home
    @products = Product.order("created_at desc").paginate(page: params[:page], per_page: 10)
    @product_best = Product.order("sale_count desc").limit 3
  end

  def help; end
end
