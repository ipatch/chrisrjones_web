# frozen_string_literal: true

# ApplicationController serves as the parent class for all controllers in the application.
# It contains common methods and filters that are shared across multiple controllers.
class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  def default_url_options
    { format: :html }
  end

  private

  def confirm_logged_in
    if session[:user_id]
      true
    else
      flash[:notice] = t('notices.please_login')
      redirect_to(controller: 'access', action: 'login')
      false # halts the before_action
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    reset_session
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: t('alerts.not_authorized')
  end
end
