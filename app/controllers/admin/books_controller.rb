class Admin::BooksController < ApplicationController
  before_action :find_book, only: :destroy
  before_action :authenticate_user!
  before_action :vefiry_admin

  def new
    @categories = Category.all
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "flash.book.created.success"
      redirect_to root_path
    else
      flash[:danger] = t "flash.book.created.fails"
      @categories = Category.all
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :num_pages, :publish_date,
      :description, :rate, :category_id, :bootsy_image_gallery_id)
  end

  def find_book
    @book = Book.friendly.find params[:id]
  end

  def vefiry_admin
    unless current_user.admin?
      flash[:danger] = t "flash.permission.denied"
      redirect_to new_user_session_path
    end
  end
end
