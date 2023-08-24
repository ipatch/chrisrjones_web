# frozen_string_literal: true

# controller for managing attachments
class AttachmentsController < ApplicationController
  # before_action :set_attachment, only: %i[show edit update destroy]
  # before_action :authorize, only: %i[new create update destroy]
  # before_action :authorize, except: [:new]

  # rails 5.x
  skip_before_action :verify_authenticity_token
  # rails 4.x
  # before_filter :authorize, only: [:new, :creeate, :update, :destroy]
  # skip_before_filter :verify_authenticity_token

  require 'base64'

  # GET /attachments
  # GET /attahcments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show; end

  # GET /attachments/:id/view
  def view
    @attachment = Attachment.find(params[:id])
    send_attachment(@attachment, 'inline')
  end

  # GET attachments/download/:id
  def download
    a = Attachment.find(params[:id])

    if a.id <= 66
      send_data(Base64.decode64(a.file_contents),
        type: a.content_type,
        disposition: 'attachment; filename="' + a.filename + '"') # Set the Content-Disposition header
    else
      send_data a.file_contents,
        type: a.content_type,
        disposition: 'attachment; filename="' + a.filename + '"'
    end
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
    # create_attachment
  end

  # GET /attachments/1/edit
  def edit; end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    upload_file
    respond_to do |format|
      if save_attachment
        handle_successful_creation(format)
      else
        handle_failed_creation(format)
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html redirect_to @attachment, notice: t('notice.attatchment_updated')
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
    @attachment = Attachment.find(params[:id]) # Find the attachment by its ID

    respond_to do |format|
      if @attachment.destroy # Check if the destroy operation was successful
        format.html { redirect_to attachments_url, notice: t('notice.attachment_removed') }
        format.json { head :no_content }
      else
        format.html { redirect_to attachments_url, alert: t('alert.attachment_not_removed') }
        format.json { render json: { error: 'Attachment could not be removed' }, status: :unprocessable_entity }
      end
    end
  end

  private

  # Common logic for creating an attachment
  def create_attachment
    # You can use the same logic as in the create action here
    @attachment = Attachment.new(attachment_params)
    upload_file
    respond_to do |format|
      if save_attachment
        handle_successful_creation(format)
      else
        handle_failed_creation(format)
      end
    end
  end

  def send_attachment(attachment, disposition)
    data = retrieve_attachment_data(attachment)
    send_data(
      data,
      type: attachment.content_type,
      disposition: "#{disposition}; filename=\"#{attachment.filename}\"",
      status: :ok
    )
  end

  def retrieve_attachment_data(attachment)
    if attachment.id <= 66
      Base64.decode64(attachment.file_contents)
    else
      attachment.file_contents
    end
  end

  def handle_successful_creation(format)
    format.html { redirect_to @attachment, notice: t('notice.attachment_created') }
    format.json { render :show, status: :created, location: @attachment }
  end

  def handle_failed_creation(format)
    format.html { render :new }
    format.json { render json: @attachment.errors, status: :unprocessable_entity }
  end

  def upload_file
    @attachment.uploaded_file(params[:attachment][:file])
  end

  def save_attachment
    @attachment.save
  end

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    # params.require(:attachment)
    params.require(:attachment).permit(:file)
  end
end
