class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      flash[:danger] = t "flash.comment.error"
    end
  end

  def destroy
    @comment = current_user.comments.detect{|comment| comment.id == params[:id].to_i}
    if @comment.destroy
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      flash[:danger] = t "flash.comment.error"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id, :user_id
  end
end
