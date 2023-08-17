# frozen_string_literal: true

module Api
  class ArticlesController < ApiController # :nodoc:
    # CSRF provided by rails is problematic for API controllers
    # disable CSRF on a controller basis
    # before_action :authorize, only: [:create, :edit, :update, :destroy]
    before_action :set_article, only: %i[show update destroy]
    skip_before_action :authorize_request, only: %i[hello empty]

    #
    # EXP
    #
    skip_before_action :authorize_request, only: :index

    # skip_before_action :verify_authenticity_token, only: :hello

    include Response # `./app/controllers/concerns/`
    include ExceptionHandler # `./app/controllers/concerns/`

    def foo1; end

    # NOTE: no GET response cuz no route points to this method.
    def foo
      # on purpose
      Rails.logger.debug 'hello from ./app/controllers/api/articles_controller#foo'
    end

    # GET /api/hello
    # GET /api/hell0 # defined in `routes.rb`
    def hello
      render json: 'hello from ./app/controllers/api/articles_controller#hello'
    end

    def empty
      render json: []
    end

    # GET /api/articles
    def index
      # get the current user articles
      # @articles = current_user.Articles

      @articles = Article.all
      json_response(ArticleSerializer.new(@articles).serialized_json)

      # @articles = Article.all
      # json_response(@articles) # WORKS
    end

    # GET /articles/:id
    def show
      json_response(@article)
    end
    # NOTE: `create` generates an object, and saves it to the DB
    # NOTE: `new` generates an object, that will require saving to the DB.
    # NOTE: `create!` will raise an exception

    # POST /api/articles
    def create
      # create articles belonging to current user
      # @article = current_user.article.create!(article_params)

      @article = Article.create!(article_params)
      json_response(@article, :created)
    end

    # PUT /articles/:id
    def update
      @article.update(article_params)
      head :no_content
    end

    # DELETE /articles/:id
    def destroy
      @article.destroy
      head :no_content
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    # NOTE: doublecheck `./app/modles/article.rb` as well.
    def article_params
      params.permit(:title, :text, :slug)
    end

    def authorize
      redirect_to login_url, alert: 'Not authorized' if current_user.nil?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      reset_session
    end
  end
end
