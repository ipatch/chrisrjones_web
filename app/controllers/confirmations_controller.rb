# frozen_string_literal: true

class ConfirmationsController < ApplicationController # :nodoc:
  def new; end

  def edit
    @user = User.find_by!(confirmation_token: params[:id])
    update
  end

  def update
    # @user = User.find_by_confirmation_token!(params[:id])
    if @user.confirmation_sent_at < 2.hours.ago
      redirect_to new_confirmation_path, alert: t('alert.confirmation_expired')
      # elseif @user.update_attributes(params[:user])
    elsif @user.update(confirmed: true)
      redirect_to root_url, notice: t('notice.confirmation_confirmed')
    else
      render :new
    end
  end
end
