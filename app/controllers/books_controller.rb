class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :load_book, only: :show

  def index
    @search = Book.search params[:q]
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    @books = @search.result.paginate page: params[:page], per_page: Settings.paginate_per_page
  end

  def show
  end

  private
  def load_book
    @book = Book.friendly.find params[:id]
  end
end
