# frozen_string_literal: true

class UsersController < ApplicationController
  # rails 5.x
  before_action :authorize, only: [:edit, :update, :destroy]

  # rails 4.2.x
  # before_filter :authorize, only: [:edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

  def foo
    render foo
  end

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # send confirmation email after user has been created.
      @user.send_confirmation

      # session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def edit
    # if session[:user_id] == @user = User.find(params[id])
    @user = User.find(params[:id])
  end

  def update
    # @user= User.find(params[:id])
    @user = User.find(params[:id])
    if session[:user_id] == @user.id || current_user.admin_user == true
      respond_to do |format|
        # if @user.update_attributes(params[:user])
        if @user.update_attributes(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to users_url, notice: 'Can not edit this user'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
