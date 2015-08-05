class BooksController < ApplicationController
  def index
    @search = Book.search params[:q]
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    @books = @search.result.paginate page: params[:page], per_page: Settings.paginate_per_page
  end
end
