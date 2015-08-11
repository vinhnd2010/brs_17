class Admin::UsersController < ApplicationController
  before_action :verify_admin

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.paginate_per_page
  end

  def destroy
    if User.friendly.find(params[:id]).destroy
      flash[:success] = t "flash.user.deleted"
      redirect_to admin_users_path
    else
      flash[:fail] = t "flash.user.undeleted"
    end
  end
end
