module SessionsHelper
  def current_user? user
    user == current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end
end
