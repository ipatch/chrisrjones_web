class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  	def confirm_logged_in
    	unless session[:user_id]
      		flash[:notice] = "Please log in."
      		redirect_to(:controller => 'access', :action => 'login')
      		return false # halts the before_action
    	else
      		return true
    	end
  	end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end
end
