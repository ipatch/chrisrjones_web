# frozen_string_literal: true

class ContactController < ApplicationController # :nodoc:
  before_action :new

  def index
    @message = Message.new
  end

  def contact
    @message = Message.new
  end

  def new
    # binding.pry
    # @message = Message.new
    # @contact = Contact.new
    @contact = Message.new
  end

  # def create
  #   @name = params[:contact_form][:name]
  #   @last_name = params[:contact_form][:last_name]
  #   @email = params[:contact_form][:email]
  #   @message = params[:contact_form][:message]
  #
  #   # Perform any necessary actions with the form data
  #   flash[:success] = "Your message has been sent successfully."
  #   redirect_to :root
  # end

  def create
    @message = Message.new
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
