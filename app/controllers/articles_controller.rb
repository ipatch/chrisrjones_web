class ArticlesController < ApplicationController

	before_filter :authorize, only: [:create, :edit, :update, :destroy]

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

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find_by_slug(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find_by_slug(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text, :slug)
		end
end