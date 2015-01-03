class ArticlesController < ApplicationController

	before_filter :authorize, only: [:create, :edit, :update, :destroy]

	# before_filter :require_authorization, only: [:delete]

	skip_before_filter :verify_authenticity_token

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find_by_slug(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @article }
		end
	end

	def new
		@article = Article.new
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
		if @article.user_id == current_user.id
			@article.update(article_params)
			redirect_to @article
		else
			flash[:notice] = 'Not the author of the article!'
			render 'edit'
		end
	end

	def destroy

		@article = Article.find_by_slug(params[:id])
		if current_user == @article.user
			@article.destroy
		end

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text, :slug, :meta_description)
		end

		# def require_authorization
		# 	redirect_to :root unless current_user.articles.find_by_slug(params[:id])
		# 	# Use the find_by to avoid the ActiveRecord::RecordNotFound and get a nil
		# 	# instead in case the question id doesn't belong to a question of the user
		# end
end