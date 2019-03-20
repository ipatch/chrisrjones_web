module Api # namespace
  # module V1 # scope
    class ArticlesController < ApplicationController
      include Response
      include ExceptionHandler

      # before_filter :authorize, only: [:create, :edit, :update, :destroy]

      # skip_before_filter :verify_authenticity_token

      # GET /articles
      def index
        @articles = Article.all
        json_response(@articles)
      end

      
      def new
        if current_user == nil
          redirect_to login_path
        else
          @article = Article.new
        end
      end

      # POST /articles
      def create
        @article = Article.create!(article_params)
        json_response(@article, :created)
      end

        # set the user_id in the controller not the form.
        # @article.user_id = current_user.id if current_user

        # if @article.save
          # redirect_to @article
        # else
          # render 'new'
        # end
      # end

      def show
        json_response(@article)
        # @article = Article.find_by_slug(params[:id])
        # respond_to do |format|
        #   format.html # show.html.erb
        #   format.json { render json: @article }
        # end
      end

      # def edit
      #   @article = Article.find_by_slug(params[:id])
      # end

      def update
        @article.update(article_params)
        head :no_content
      end
        # @article = Article.find_by_slug(params[:id])
        # if @article.user_id == current_user.id || current_user.admin_user == true
        #   @article.update(article_params)
        #   redirect_to @article
        # else
        #   flash[:notice] = 'Not the author of the article!'
        #   render 'edit'
        # end
      # end

      def destroy
        @aritcle.destory
        head :no_content
      end

        # @article = Article.find_by_slug(params[:id])
        # if current_user == @article.user || current_user.admin_user == true
        #   @article.destroy
        # end

        # redirect_to articles_path
      # end

      private

      def article_params
        # params.require(:article).permit(:title, :text, :slug, :meta_description)
        params.permit(:title, :text, :slug, :meta_description, :created_by)
      end
      # def require_authorization
      # 	redirect_to :root unless current_user.articles.find_by_slug(params[:id])
      # 	# Use the find_by to avoid the ActiveRecord::RecordNotFound and get a nil
      # 	# instead in case the question id doesn't belong to a question of the user
      # end
    end
end
# end
