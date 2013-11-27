class ApplicationController < ActionController::Base
  protect_from_forgery

  def login user
    session[:user_id] = user.id
  end

  def current_user
    @user ||= User.find session[:user_id] if session[:user_id]
  end

  helper_method :current_user
end
