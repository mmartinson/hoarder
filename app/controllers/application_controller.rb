class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    session[:user_id] ? true : false
  end
  helper_method :user_signed_in?

  def current_user
    User.find_by_id(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

  def authenticate_user! 
    unless user_signed_in?
      redirect_to new_session_path, alert: "Sign in before continuing"
    end
  end
end
