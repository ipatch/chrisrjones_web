# frozen_string_literal: true

class PasswordResetsController < ApplicationController # :nodoc:
  def new; end

  def create
    user = User.find_by(params[:email])
    user&.send_password_reset
    redirect_to root_url, notice: 'Email sent with password reset instructions.'
  end

  def edit
    @user = User.find_by!(password_reset_token: params[:id])
    # @user = User.find_by_password_reset_token!(password_params)
  end

  def update
    @user = User.find_by!(password_reset_token: params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: 'Password reset has expired.'
      # elseif @user.update_attributes(params[:user])
    elsif @user.update(password_params)
      redirect_to root_url, notice: 'Password has been reset!'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
