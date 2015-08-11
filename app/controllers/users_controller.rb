class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def index
    @users = User.order("name").paginate page: params[:page],
      per_page: Settings.paginate_per_page
  end

  def show
    @user = User.friendly.find params[:id]
    @user = current_user if @user.nil?
    @book_users = @user.book_users.favorite
  end
end
