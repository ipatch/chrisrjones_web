# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authorize, only: [:create, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find_by_slug(params[:id])
		respond_to do |format|
			format.html # show.html.erb
		end
	end

	def new
		if current_user == nil
			redirect_to login_path
		else
			@article = Article.new
		end
	end

	def edit
		@article = Article.find_by_slug(params[:id])
	end

	def create
		@article = Article.new(article_params)
		# set the user_id in the controller not the form.
		@article.user_id = current_user.id if current_user

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find_by_slug(params[:id])
		if @article.user_id == current_user.id || current_user.admin_user == true
			@article.update(article_params)
			redirect_to @article
		else
			flash[:notice] = 'Not the author of the article!'
			render 'edit'
		end
	end

	def destroy
		@article = Article.find_by_slug(params[:id])
		if current_user == @article.user || current_user.admin_user == true
			@article.destroy
		end
		redirect_to articles_path
	end
  
	private
  def article_params
    params.require(:article).permit(:title, :text, :slug, :meta_description)
  end
end
