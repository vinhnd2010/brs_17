class BookUsersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :load_book_user, only: :create

  def create
    @book_user.favorite = Settings.book_users.favorited == params[:action_type]
    if @book_user.save
      flash[:success] = t "flash.book.action.update"
      respond_to do |format|
        format.html {redirect_to @book_user}
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
