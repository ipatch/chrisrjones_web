# frozen_string_literal: true

class ContactController < ApplicationController # :nodoc:
  before_action :new

  def index
    @message = Message.new
  end

  def contact
    @message = Message.new
  end

  def show
    @message = Message.find_by(params[:id])
    respond_to(&:html)
  end

  def new
    # binding.pry
    @message = Message.new
    # @contact = Contact.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      UserMailer.new_message(@message).deliver_now
      redirect_to root_url, notice: t('notices.message_sent')
    else
      flash.now.alert = 'Please fill all fields.'
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :body)
  end
end
