class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  include Response

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize!
    redirect_to root_path if !current_user
  end
end