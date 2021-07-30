class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :current_admin, :logged?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged?
    !!current_admin
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perfome that action."
      redirect_to login_path
    end
  end

  def require_admin
    if !logged?
      flash[:notice] = "You must be logged in to perfome that action."
      redirect_to login_path
    end
  end

  



end
