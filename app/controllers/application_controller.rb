# frozen_string_literal: true

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
      flash[:notice] = 'Please log in.'
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
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
