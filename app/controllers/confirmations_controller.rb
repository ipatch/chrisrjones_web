class ConfirmationsController < ApplicationController

	def new
	end

	def edit
		@user = User.find_by_confirmation_token!(params[:id])
		update
	end

	def update
		# @user = User.find_by_confirmation_token!(params[:id])
  		if @user.confirmation_sent_at < 2.hours.ago
  			redirect_to new_confirmation_path, :alert => "Confirmation has expired."
  		# elseif @user.update_attributes(params[:user])
  		elsif @user.update_attributes(confirmed: true)
  			redirect_to root_url, :notice => "Your account has been confirmed."
  		else
  			render :new
  		end
	end
end
