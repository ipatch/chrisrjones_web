class AttachmentsController < ApplicationController
	before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # rails 5.x
  before_action :authorize, only: [:new, :create, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # rails 4.x
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
    a = Attachment.find(params[:id])
    send_data a.file_contents,
      :type => a.content_type,
      :disposition => 'attachment',
      :filename =>  a.filename

  # TODO properly handle download errors
  # rescue
    # render :nothing => true, :status => 404
  end

	def view
		@attachment = Attachment.find(params[:id])
		send_data(Base64.decode64(@attachment.file_contents), type: @attachment.content_type, :disposition => 'inline')
	end

  def show
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

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachments_url, notice: 'Attachment successfully removed.' }
      format.json { head :no_content }
    end
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
