# frozen_string_literal: true

# UsersController handles user-related actions such as registration, profile editing, and deletion.
class UsersController < ApplicationController
  # rails 5.x
  # Applies authorization checks before executing specified actions.
  # Only authorized users can perform edit, update, and destroy actions.
  before_action :authorize, only: %i[edit update destroy]

  # Skips authenticity token verification to allow API requests.
  skip_before_action :verify_authenticity_token

  # rails 4.2.x
  # before_filter :authorize, only: [:edit, :update, :destroy]

  def foo
    render foo
  end

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def edit
    # if session[:user_id] == @user = User.find(params[id])
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # send confirmation email after user has been created.
      @user.send_confirmation

      # session[:user_id] = @user.id
      redirect_to root_url, notice: t('notices.thanks_for_signing_up')
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if user_editable?(@user)
      update_user_and_respond
    else
      redirect_to users_url, notice: t('notices.cannot_edit_user')
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = t('notices.user_deleted')
    redirect_to root_url
  end

  private

  def user_editable?(user)
    session[:user_id] == user.id || current_user.admin_user
  end

  def update_user_and_respond
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('notices.user_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
