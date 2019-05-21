# frozen_string_literal: true

class ApiController < ActionController::API
  # protect_from_forgery with: :null_session # NOT HOTDOG 🌭
  before_action :authorize_request
  attr_reader :current_user

  private

  # check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
