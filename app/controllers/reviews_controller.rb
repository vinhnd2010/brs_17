class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t "flash.review.created.success"
    else
      flash[:danger] = @review.errors.full_message.join(", ")
    end
    redirect_to book_path @review.book
  end

  private
  def review_params
    params.require(:review).permit :content, :score, :book_id, :user_id
  end
end
