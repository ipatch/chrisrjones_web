class AttachmentsController < ApplicationController
	before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # rails 5.x
  before_action :authorize, only: [:new, :create, :update, :destroy]
  skip_before_action :verify_authenticity_token
	# before_filter :authorize, only: [:new, :creeate, :update, :destroy]
	# skip_before_filter :verify_authenticity_token

	require "base64"

  # GET /documents
  # GET /documents.json
	def index
		@attachments = Attachment.all
	end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  def download
    @attachment = send_data(@attachment.file_contents,
              type: @attachment.content_type,
              filename: @attachment.filename)
  end

	def view
		@attachment = Attachment.find(params[:id])
		send_data(Base64.decode64(@attachment.file_contents), type: @attachment.content_type, :disposition => 'inline')
	end

  def show
  	# send_data(Base64.decode64(@attachment.file_contents),
  	# 	type: @attachment.content_type,
  	# 	filename: @attachment.filename)
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.uploaded_file(params[:attachment][:file])

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to attachments_url, notice: 'Attachment saved.' }
        format.json { render :show, status: created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
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
    # params.require(:attachment)
    params.require(:attachment).permit(:file)
  end
end
