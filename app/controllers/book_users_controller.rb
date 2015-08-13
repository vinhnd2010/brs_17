class BookUsersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :load_book_user, only: :create

  def create
    case params[:action_type]
    when Settings.book_users.reading
      @book_user.status = BookUser.statuses[:reading]
    when Settings.book_users.readed
      @book_user.status = BookUser.statuses[:readed]
    when Settings.book_users.favorited
      @book_user.favorite = true
    when Settings.book_users.unfavorited
      @book_user.favorite = false
    end
    if @book_user.save
      flash[:success] = t "flash.book.action.update"
      respond_to do |format|
        format.html {redirect_to @book}
        format.js
      end
    else
      flash[:danger] = t "flash.book.action.unupdate"
    end
  end

  private
  def load_book_user
    @book = Book.friendly.find params[:book_id]
    @book_user = BookUser.find_or_initialize_by user_id: current_user.id,
      book_id: @book.id
  end
end
