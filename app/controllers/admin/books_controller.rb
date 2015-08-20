class Admin::BooksController < ApplicationController
  before_action :find_book, except: [:new, :create, :index]
  before_action :authenticate_user!
  before_action :verify_admin

  def index
    @books = Book.order("title").paginate page: params[:page],
      per_page: Settings.paginate_per_page
  end

  def new
    @categories = Category.all
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "flash.book.created.success"
      redirect_to admin_books_path
    else
      flash[:danger] = t "flash.book.created.fails"
      @categories = Category.all
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @book.update book_params
      flash[:success] = t "flash.book.updated.success"
      redirect_to admin_books_path
    else
      flash[:danger] = t "flash.book.updated.fails"
      @categories = Category.all
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :num_pages, :publish_date,
      :description, :rate, :category_id, :cover, :bootsy_image_gallery_id)
  end

  def find_book
    @book = Book.friendly.find params[:id]
  end
end
