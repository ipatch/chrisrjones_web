# frozen_string_literal: true

# SessionsController handles user authentication and session management.
class SessionsController < ApplicationController
  def new; end

  def create
    user = find_user_by_email

    if valid_user?(user)
      log_in_user(user)
      redirect_to root_url, notice: t('notices.logged_in')
    else
      handle_invalid_credentials
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t('notices.logged_out')
  end

  private

  def find_user_by_email
    User.find_by(email: params[:email])
  end

  def valid_user?(user)
    user&.authenticate(params[:password]) && user&.confirmed
  end

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def handle_invalid_credentials
    flash.now.alert = t('alerts.invalid_credentials')
    render 'new'
  end
end
