# frozen_string_literal: true

# BaseController for API controllers, responsible for authorization and authentication.
class ApiController < ActionController::API
  # protect_from_forgery with: :null_session # NOT HOTDOG 🌭
  attr_reader :current_user

  # check for valid request token and return user
  def authorize_request
    token = extract_token_from_header

    render_unauthorized_error and return if token.blank?

    @current_user = find_user_from_token(token)

    render_token_revoked_error and return if token_blacklisted?(token)
  rescue JWT::DecodeError
    render_unauthorized_error
  end

  private

  def extract_token_from_header
    authorization_header = request.headers['Authorization']
    authorization_header&.split&.last
  end

  def find_user_from_token(token)
    decoded_token = JsonWebToken.decode(token)
    User.find_by(id: decoded_token[:user_id])
  end

  def render_unauthorized_error
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def token_blacklisted?(token)
    TokenBlacklist.exists?(jwt_token: token)
  end

  def render_token_revoked_error
    render json: { error: 'Token revoked' }, status: :unauthorized
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
