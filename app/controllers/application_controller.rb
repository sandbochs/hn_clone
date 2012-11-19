class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticated?
    !current_user.nil?
  end

  def authenticate_user!
    if !authenticated?
      redirect_to sessions_path
    end
  end

  helper_method :current_user, :authenticated?, :authenticate_user!
end
