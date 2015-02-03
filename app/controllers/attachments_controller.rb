class AttachmentsController < ApplicationController
	before_action :set_attachment, only: [:show, :edit, :update, :destroy]

	require "base64"

	def index
		@attachments = Attachment.all
	end

	def view
		@attachment = Attachment.find(params[:id])
		send_data(Base64.decode64(@attachment.file_contents),:type => 'image', :disposition => 'inline')

	end

  def show
  	# @attachment = Attachment.find(params[:id])
  	# end_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
  	send_data(Base64.decode64(@attachment.file_contents),
  		type: @attachment.content_type,
  		filename: @attachment.filename)
  end

  def new
  	@attachment = Attachment.new
  end

  def create
  	# @article = Article.find(params[:article_id])
  	# @attachment = @article.attachments.create(attachment_params)
  	return if params[:attachment].blank?

  	@attachment = Attachment.new(attachment_params)
  	# @attachment.upload_file = params(attachment_params)

  	if @attachment.save
  		flash[:notice] = "Thank you for your submission..."
  		redirect_to attachments_path
  	else
  		flash[:error] = "There was a problem submitting your attachment."
  		render "new"
  	end
  end

  	def destroy
  		@attchment = Attachment.find(params[:id])
  		if @attachment.present?
			@attachment.destroy
		end
		redirect_to attachments_url
	end

  private

  	def set_attachment
  		@attachment = Attachment.find(params[:id])
  	end

  	def attachment_params
  		params.require(:attachment).permit(:file)
  	end
end
