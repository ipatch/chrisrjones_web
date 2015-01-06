class UsersController < ApplicationController

	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		# @user= User.find(params[:id])
		@user = User.find(params[:id])

    	respond_to do |format|
      		# if @user.update_attributes(params[:user])
      		if @user.update_attributes(user_params)
        		format.html { redirect_to @user, notice: 'User was successfully updated.' }
        		format.json { head :no_content }
      		else
        		format.html { render action: "edit" }
        		format.json { render json: @user.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def destroy
		# presently the session / cookie is being left in the browser
		# need to figure out how to reset cookie / session
		session[:user_id] = nil
    	@user = User.find(params[:id])
    	@user.destroy
    	redirect_to :controller=>'users', :action => 'new'
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end
end