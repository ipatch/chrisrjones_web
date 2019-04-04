class ApplicationController < ActionController::Base
  # protect_from_forgery
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def json_response(object, status = :ok)
    render json: object, status: status
  end


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
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    
    helper_method :current_user 

    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end
end
