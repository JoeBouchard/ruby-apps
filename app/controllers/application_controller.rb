require "omniauth"

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protect_from_forgery with: :exception
  helper_method :current_user

  def require_authentication
    redirect_to login_path, method: :post, alert: "Requires authentication" unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    # converts current_user to a boolean by negating the negation
    !!current_user
  end

  def new
    # code here
  end

  def index
    # code here
  end
end
