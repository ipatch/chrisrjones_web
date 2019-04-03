# module Api # namespace
# module V1 # scope
require_relative '../api_controller.rb'
class Api::ArticlesController < ApiController
  # Out of the box, rails comes with CSRF which is problematic when developing APIs, thus CSRF can be turned off on a controller basis.

  # NOTE: `respond_to` migrated to separate gem
  # respond_to :json

  include Response # `./app/controllers/concerns/`
  # include ExceptionHandler

  # NOTE: no GET response cuz no route points to this method.
  def foo # on purpose
    puts 'hello from ./app/controllers/api/articles_controller#foo'
  end

  # GET /api/hello
  # GET /api/hell0 # defined in `routes.rb`
  def hello
    render json: 'hello from ./app/controllers/api/articles_controller#hello'
  end

  # GET /api/articles
  def index
    @articles = Article.all
    json_response(@articles) # WORKS
  end

  # NOTE: `create` generates an object, and saves it to the DB whereas  `new` just generates an object, that will later require saving to the DB.

  # POST /api/articles
  # def create
  #   @article = Article.create!(article_params)
  #   json_response(@article, :created)
  # end

  def create
    @article = Article.new(article_params)
    if @article.save
      # json_response(@article) 
      # json_response do |format|
      #   format.json { render :json => @article }
      # end
      render plain:
        { error: 'Mr Fancy Error Message.' }.to_json,
        status: 422,
        content_type: 'application/json'
    end
  end

  # GET /article/:id
  def show
    @article = Article.find(params[:id])
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

  end

  # def article_params
  #   # params.require(:article).permit(:title, :text, :slug, :meta_description)
  #   # params.permit(:title, :text, :slug, :meta_description, :created_by)
  #   # params.permit(:title)
  #   params.require(:article).permit(:title)
  # end

  # def set_article
  #   @article = Article.find(params[:id])
  # end

  # def set_article
  #   @article = Article.find(params[:id])
  # end
end
# end
# end
