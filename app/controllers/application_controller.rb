class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email,
      :password, :password_confirmation, :remember_me)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email,
      :password, :password_confirmation, :current_password)}
  end

  def verify_admin
    authenticate_user!
    redirect_to root_path unless current_user.admin?
  end
end
