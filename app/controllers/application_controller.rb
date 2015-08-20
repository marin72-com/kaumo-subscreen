class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

    helper_method :logged_in?
    def logged_in?
      !!session[:user_id]
    end

    helper_method :current_user
    def current_user
      return unless logged_in?
      @current_user ||= User.find(session[:user_id])
    end

    def require_user
      unless logged_in?
        session[:back_url] = request.fullpath
        redirect_to '/auth/twitter'
      end
    end

end
