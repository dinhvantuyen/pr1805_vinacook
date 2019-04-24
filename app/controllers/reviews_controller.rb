class ReviewsController < ApplicationController

  def create
    @product = Product.find_by id: params[:review][:product_id]
    @review = current_user.reviews.build review_params
    @review.save
    @review = Review.new
    respond_to do |format|
      format.js
    end
  end

  private

  def review_params
    params.require(:review).permit :rate, :comment, :product_id
  end
end
