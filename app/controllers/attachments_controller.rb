class AttachmentsController < ApplicationController
  

  def show
  	@attachment = Attachment.find(params[:id])
  	end_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
  end

  def create
  	@article = Article.find(params[:article_id])
  	@attachment = @article.attachments.create(attachment_params)
  	redirect_to article_path(@article)
  end

  def destroy
  	@article = Article.find(params[:article_id])
  	@attachment = @article.attachments.find(params[:id])
  	@attachment.destroy
  	redirect_to article_path(@article)
  end

  private
  	def attachment_params
  		params.require(:attachment).permit(:filename,:content_type,:data)
  	end
end
