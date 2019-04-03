class ReviewsController < ApplicationController
  def create
    @product = Product.find_by id: params[:review][:product_id]
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = "Rating successfully!"
      redirect_to @product
    else
      flash[:warning] = "Rating failed"
      redirect_to @product
    end
  end

  private

  def review_params
    params.require(:review).permit :rate, :comment, :product_id
  end
end
