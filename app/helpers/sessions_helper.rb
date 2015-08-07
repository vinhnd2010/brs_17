module SessionsHelper
  def current_user? user
    user == current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
