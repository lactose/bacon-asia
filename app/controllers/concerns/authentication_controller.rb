module AuthenticationController
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def require_login
    if logged_in?
      # TODO update session
    else
      flash[:notice] = 'Please login to continue'
      remember_location
      redirect_to root_url
    end
  end

  def logged_in?
    current_user && session[:user_id]
  end

  private

  def remember_location
    session[:return_path] = params[:return_path] || request.fullpath
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
