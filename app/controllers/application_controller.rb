class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # find current logged-in user if session[:user_id] is set
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # allows us to use current_user in views
  helper_method :current_user

  def authorize
    unless current_user
      redirect_to login_path
    end
  end
  
end
