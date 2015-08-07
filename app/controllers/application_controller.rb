class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include SessionsHelper

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email,
      :password, :password_confirmation, :remember_me)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email,
      :password, :password_confirmation, :current_password)}
  end

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = t "flash.user.mustlogin"
      redirect_to login_url
    end
  end

  def verify_admin
    unless current_user.admin?
      flash[:danger] = t "flash.user.permistion"
      redirect_to root_url
    end
  end
end
