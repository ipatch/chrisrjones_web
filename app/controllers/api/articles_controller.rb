module Api # namespace
  # module V1 # scope
    class ArticlesController < ApplicationController
      # Out of the box, rails comes with CSRF which is problematic when developing APIs, thus CSRF can be turned off on a controller basis.
      protect_from_forgery with: :null_session
      #
      skip_before_action :verify_authenticity_token
      #
      
      #
      # disable session functionality for api related features
      #
      # before_action :destroy_session

      include Response
      include ExceptionHandler

      # GET /articles
      def index
        @articles = Article.all
        json_response(@articles)
      end

      # NOTE: `create` generates an object, and saves it to the DB whereas  `new` just generates an object, that will later require saving to the DB.

      # POST /articles
      def create
        @article = Article.create!(article_params)
        json_response(@article, :created)
      end

      # GET /articles/:id
      def show
        json_response(@article)
      end

      # PUT /todos/:id
      def update
        @article.update(article_params)
        head :no_content
      end

      # DELETE /todos/:id
      def destroy
        @aritcle.destory
        head :no_content
      end

      private

      def article_params
        # params.require(:article).permit(:title, :text, :slug, :meta_description)
        # params.permit(:title, :text, :slug, :meta_description, :created_by)
        # params.permit(:title)
        params.require(:article).permit(:title)
      end

      def set_article
        @article = Article.find(params[:id])
      end
    end
end
