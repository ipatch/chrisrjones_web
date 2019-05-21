# frozen_string_literal: true

class CommentsController < ApplicationController
  # rails 5.x
  before_action :authorize, only: [:create, :edit, :update, :destroy]

  # rails 4.2.x
	# before_filter :authorize, only: [:create, :edit, :update, :destroy]

	skip_before_action :verify_authenticity_token

	def create
		@article = Article.find_by_slug(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
    	@article = Article.find_by_slug(params[:article_id])
    	if current_user == @article.user || current_user.admin_user == true
    		@comment = @article.comments.find(params[:id])
    		@comment.destroy
    	end
    	redirect_to article_path(@article)
  	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
