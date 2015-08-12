class LikesController < ApplicationController
  before_action :user_signed_in?
  before_action :load_like, only: :create

  def create
    @like.status = Settings.likes.like == params[:action_type]
    if @like.save
      flash[:success] = t "flash.book.action.update"
      respond_to do |format|
        format.html {redirect_to request.referer}
        format.js
      end
    else
      flash[:danger] = t "flash.book.action.unupdate"
    end
  end

  private
  def load_like
    @activity = Activity.find params[:activity_id]
    @like = Like.find_or_initialize_by user_id: current_user.id,
      activity_id: @activity.id
  end
end
