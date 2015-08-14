class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @categories = Category.latest
    @book_users = current_user.book_users
  end
end
