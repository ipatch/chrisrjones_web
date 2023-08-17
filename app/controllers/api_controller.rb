# frozen_string_literal: true

# BaseController for API controllers, responsible for authorization and authentication.
class ApiController < ActionController::API
  # protect_from_forgery with: :null_session # NOT HOTDOG 🌭
  attr_reader :current_user

  private

  # check for valid request token and return user
  def authorize_request
    authorization_header = request.headers['Authorization']
    token = authorization_header.split.last if authorization_header

    if token.present?
      decoded_token = JsonWebToken.decode(token)
      @current_user = User.find_by(id: decoded_token[:user_id])
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized and return
    end

    # Check if the token is blacklisted
    if @current_user && TokenBlacklist.exists?(jwt_token: authorization_header)
      render json: { error: 'Token revoked' }, status: :unauthorized and return
    end
  rescue JWT::DecodeError
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def authenticate_token
    token = request.headers['Authorization']
    if token.present?
      AuthorizeApiRequest.new(request.headers).call
    else
      { user: nil }
    end
  end
end
