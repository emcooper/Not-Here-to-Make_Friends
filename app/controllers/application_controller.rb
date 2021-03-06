class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :current_admin?,
                :require_login,
                :current_season,
                :current_week

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_season
    Season.find_by(status: "active")
  end

  def current_week
    Week.current_week
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
